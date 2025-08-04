FROM ubuntu:24.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
  curl git build-essential wget gnupg ca-certificates

# Install Node.js 22
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    node -v && npm -v

# Install n8n globally
RUN npm install -g n8n

# Install uvx from GitHub
RUN git clone https://github.com/Hawstein/uvx.git /uvx && \
    cd /uvx && npm install && npm link

# Expose n8n default port
EXPOSE 5678

# Start n8n by default
CMD ["n8n"]
