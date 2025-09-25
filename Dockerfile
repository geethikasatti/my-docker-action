# Dockerfile
FROM debian:12-slim

# Install minimal runtime utilities, including sudo
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    bash \
    sudo \
  && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m actionuser

# Add the user to the sudoers file to allow passwordless sudo
RUN echo "actionuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/actionuser \
  && chmod 0440 /etc/sudoers.d/actionuser

WORKDIR /home/actionuser

# Copy the entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run as non-root
USER actionuser

ENTRYPOINT ["/entrypoint.sh"]
