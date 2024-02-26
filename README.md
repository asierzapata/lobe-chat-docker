# lobe-chat-docker

## Usage

First install [ollama](https://ollama.com/) and docker if you haven't already.

Then, clone this repository and run the following commands:

```bash
cd lobe-chat-docker
./start.sh
```

This will start the lobe-chat-docker container and install the needed models.

Then you can access the chat interface at `http://localhost:3210`.

## What does each file do?

- Shell Scripts
  - `auto-update-lobe-chate.sh`: This script is used to automatically update the lobe-chat-docker image. It is intended to be run as a cron job.
  - `install-models.sh`: This script is used to install the ollama models into the ollama container. For now includes `mistral`, `gemma` and `llama2` models. To save space, each model is commented except for `gemma`.
  - `start.sh`: This script is used to start the lobe-chat-docker container and install the needed models
- Docker Files
  - `docker-compose.yml`: This is the service definition.

## Why ollama native and not in a docker container?

For the testing I've done, it seems that the ollama native version is faster than the docker version. This is why I've chosen to use the ollama native version.
