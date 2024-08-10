# Start with the base Ubuntu image
FROM ubuntu:latest

# Update and install sudo
RUN apt-get update && \
    apt-get install -y \
    sudo \
    vim \
    curl \
    git \
    tmux \ 
    && apt-get clean

# Open ports 4200 to 4205
EXPOSE 4200 4201 4202 4203 4204 4205

# Add 'ubuntu' user to the sudo group
RUN usermod -aG sudo ubuntu

# Run all remaining commands as the 'ubuntu' user
USER ubuntu

# Set working directory
WORKDIR /home/ubuntu

# Default command to run once the container starts
CMD ["bash"]
