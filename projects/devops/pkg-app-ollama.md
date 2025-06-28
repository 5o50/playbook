# Ollama on Ubuntu 24.04

A guide to using Ollama for local LLMs, with best practices and common use cases as of June 2025.

## Installation

Install Ollama on Linux with a single command.

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

After installation, the `ollama` service should start automatically.

## Service Management

It's good practice to manage Ollama with `systemd`.

```bash
# Check the status of the Ollama service
sudo systemctl status ollama

# Start the service
sudo systemctl start ollama

# Stop the service
sudo systemctl stop ollama

# Enable the service to start on boot (usually done by the installer)
sudo systemctl enable ollama
```

By default, Ollama runs as a background service. You can see it running on port 11434.

## Managing Models

You can pull models from the [Ollama library](https://ollama.com/library).

```bash
# Pull a model (e.g., llama3)
ollama pull llama3

# Pull a specific version
ollama pull mistral:7b

# List all models you have locally
ollama list

# Get information about a model
ollama show mistral

# Remove a model
ollama rm mistral
```

## Running Models

Interact with models directly from your terminal.

```bash
# Run a model and start a chat session
ollama run mistral

# Run a model with a single prompt
ollama run mistral "Why is the sky blue?"
```

## Useful Commands

A quick reference for common `ollama` commands:
- `pull`: Download a model.
- `run`: Run a model and chat with it.
- `list`: List all local models.
- `show`: Show details of a model.
- `rm`: Remove a model.
- `cp`: Copy a model.
- `serve`: Start the Ollama server (usually managed by `systemd`).
- `create`: Create a model from a Modelfile.

## Use Case: Web Interface (Open WebUI)

For a more user-friendly experience similar to ChatGPT, you can use Open WebUI. It runs in Docker and connects to your local Ollama instance.

If you have an Nvidia GPU, ensure drivers and the NVIDIA Container Toolkit are installed.

```bash
# Run Open WebUI with GPU support
docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```

If you don't have a GPU, you can run it without the `--gpus=all` flag.

Access it at `http://localhost:3000`. You can create a local account and start chatting with your models.

## Use Case: API Server

Ollama exposes a REST API on port `11434` for integrations. You can use this to build your own applications on top of Ollama.

By default, the server only listens on `127.0.0.1`. To allow network connections, you need to configure the `ollama` service to listen on `0.0.0.0`.

1.  Edit the systemd service file:
    ```bash
    sudo systemctl edit ollama.service
    ```
2.  Add the following lines to create an override file that sets the host. Using `systemctl edit` is safer than modifying the original service file directly.
    ```ini
    [Service]
    Environment="OLLAMA_HOST=0.0.0.0"
    ```
3.  Reload the daemon and restart Ollama:
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl restart ollama
    ```

Now you can send requests to `http://<your-server-ip>:11434`.

Example using `curl`:
```bash
curl http://localhost:11434/api/generate -d '{
  "model": "mistral",
  "prompt": "Why is the sky blue?",
  "stream": false
}'
```

## Customizing Models with `Modelfile`

For advanced use cases, you can create custom models using a `Modelfile`. This allows you to define system messages, set parameters, and even combine models.

Example `Modelfile`:
```
FROM mistral
SYSTEM "You are a helpful pirate assistant. Always answer in pirate speak."
```

Then create the model:
```bash
ollama create pirate-mistral -f ./Modelfile
```

And run it:
```bash
ollama run pirate-mistral
```

---
*Sources based on June 2025 search:*
- [How to install Ollama on Ubuntu 24.04 | Docker compose](https://mrcloudbook.com/how-to-install-ollama-on-ubuntu-24-04-docker-compose/)
- [Running AI on Your Own Computer with Ollama on Ubuntu/Debian](https://www.tyolab.com/blog/2025/01-23-running-ai-on-your-own-computer-with-ollama/)
- [Mastering Ollama: A Guide to Using Ollama via the CLI](https://dev.to/minima_desk_cd9b151c4e2fb/mastering-ollama-a-guide-to-using-ollama-via-the-cli-2h11)
- [Install Ollama : Server World](https://www.server-world.info/en/note?os=Ubuntu_24.04&p=ollama&f=1)
