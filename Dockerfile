# Dockerfile
FROM debian:12-slim

# Install minimal runtime utilities
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    bash \
 && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m actionuser

WORKDIR /home/actionuser

# Copy the entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run as non-root
USER actionuser

ENTRYPOINT ["/entrypoint.sh"]
