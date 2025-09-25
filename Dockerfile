# Dockerfile
FROM debian:12-slim

# Install minimal runtime utilities
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    bash \
  && rm -rf /var/lib/apt/lists/*

# Copy the entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# The container will now run as root by default
ENTRYPOINT ["/entrypoint.sh"]
