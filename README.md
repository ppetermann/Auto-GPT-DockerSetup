# Auto-GPT-DockerSetup

Welcome to the Auto-GPT-DockerSetup repository! This project aims to provide an easy-to-use starting point for users who
want to run Auto-GPT using Docker. This setup separates runtime configuration from the actual Auto-GPT repository by 
providing a Docker Compose file tailored to running an instance from a Docker image. 
The official Docker Compose file in the Auto-GPT source includes building the image, but with it always building, 
not mounting, no solution for plugin-requirements its not very pleasant to maintain.

**Note:** This template is designed to make it easier for users to get started with Auto-GPT and Docker. 
It is assumed that users have some experience with Docker and an understanding of what they're doing.


## Features
- An example `docker-compose.yml` file for running Auto-GPT in a Docker container.
- Mounts multiple directories into the container for ease of use. *For more serious setups, users should modify the Dockerfile to copy directories instead of mounting them.*
- Includes a `personas` folder with an example YAML file. Users should replace this with their own persona YAML files.
- Provides a clear structure to start from, making it easy for users to adapt the template to their specific needs.
- Uses embedded Weaviate for long-term memory storage and retrieval.
- The Dockerfile extends a specific tag, allowing for easy plugin integration without having to modify the Auto-GPT requirements file or Dockerfile.

## Getting Started, Step by Step:
1. clone this repository (or download as zip)
2. remove the `.git` folder (ideally git init . for your own)
3. copy your .env file from auto-gpt, if you don't have one yet, use their template
4. while you can setup a different memory backend, the easiest setup with long term memory is using embedded weaviate, to do so, you can configure it in your .env file as follows:
```ini
MEMORY_BACKEND=weaviate
WEAVIATE_HOST="127.0.0.1"
WEAVIATE_PORT=8080
WEAVIATE_PROTOCOL="http"
USE_WEAVIATE_EMBEDDED=True
WEAVIATE_EMBEDDED_PATH="/app/aviate"
```
5. if you want to run any plugins
    - copy their zip files into the plugins folder
    - add their requirements to requirements.txt
    - don't forget to add them to the allowed list in your .env

6. Now we get to the docker part:
    - you will have to build a base image from Auto-GPT's source first, named `autogpt-upstream`, you can do that by cloning their repo and running `docker build -t autogpt-upstream .` in the root of the repo
    - the Dockerfile in this repo extends from autogpt-upstream and uses the name `my-own-autogpt`, so the next step is to build it: `docker build -t my-own-autogpt .`
   
7. let the bot battle begin: `docker-compose run --rm auto-gpt -C personas/Entrepeneur-GPT.yml`
    - you can add --debug if  you want to see more output
    - you can add --continuous (if you dare) to launch in continuous mode


## Help!
- If you encounter a bug, please open an issue
- If you don't know what the commands described above do, don't just run them, read the documentation first
- If you get stuck, it doesn't work, but you know about things like Docker, docker-compose, git.. feel free to reach out, for example *in the related thread* on Auto-GPT's discord.
- If you don't know about those things, please refer to their documentation first. (yes I know I wrote it twice)

## Shameless plug
- The first ever Auto-GPT instance to write mastodon toots is AgentOneAI, you should follow it at https://mstdn.social/@AgentOne

## Contributors
- Peter "ppetermann" Petermann (https://devedge.eu) 
