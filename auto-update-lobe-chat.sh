#!/bin/bash
# auto-update-lobe-chat.sh

# Set proxy (optional)
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# Pull the latest image and store the output in a variable
output=$(docker pull lobehub/lobe-chat:latest 2>&1)

# Check if the pull command was executed successfully
if [ $? -ne 0 ]; then
  exit 1
fi

# Check if the output contains a specific string
echo "$output" | grep -q "Image is up to date for lobehub/lobe-chat:latest"

# If the image is already up to date, do nothing
if [ $? -eq 0 ]; then
  exit 0
fi

echo "Detected Lobe-Chat update"

# Remove the old container
echo "Removed: $(docker rm -f Lobe-Chat)"

# You may need to navigate to the directory where `docker-compose.yml` is located first
# cd /path/to/docker-compose-folder

# Run the new container
echo "Started: $(docker-compose up)"

# Print the update time and version
echo "Update time: $(date)"
echo "Version: $(docker inspect lobehub/lobe-chat:latest | grep 'org.opencontainers.image.version' | awk -F'"' '{print $4}')"

# Clean up unused images
docker images | grep 'lobehub/lobe-chat' | grep -v 'latest' | awk '{print $3}' | xargs -r docker rmi > /dev/null 2>&1
echo "Removed old images."