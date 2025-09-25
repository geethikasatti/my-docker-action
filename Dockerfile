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

# Change ownership of the /github directory to the non-root user
# This is crucial for actions that write to GitHub-provided directories
# like 'github/file_commands' or 'github/workspace'.
RUN chown -R actionuser:actionuser /github

# Run as non-root
USER actionuser

ENTRYPOINT ["/entrypoint.sh"]
