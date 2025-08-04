# Base image: same as your compose setup
FROM n8nio/n8n:latest

# Switch to root user to install dependencies
USER root

# Install system tools and build deps on Alpine
RUN apk update && apk add --no-cache \
    git \
    curl \
    nodejs \
    npm \
    python3 \
    make \
    g++ \
    bash

# Install uvx from GitHub
RUN git clone https://github.com/Hawstein/uvx.git /uvx && \
    cd /uvx && npm install && npm link && \
    rm -rf /uvx

# Switch back to the default n8n user
USER node

# Default port for n8n
EXPOSE 5678

# Start n8n
CMD ["n8n"]
