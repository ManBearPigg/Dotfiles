# Start with the base Ubuntu image
FROM ubuntu:latest

# Update and install sudo
RUN apt-get update && \
    apt-get install -y \
    sudo curl git tmux nodejs ripgrep build-essential wget npm unzip bat \
    && apt-get clean

# Set working directory
WORKDIR /home/ubuntu

# Install neovim.
RUN curl -OL https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RUN tar -xzvf nvim-linux64.tar.gz
RUN rm nvim-linux64.tar.gz
RUN mv nvim-linux64 /usr/local/bin
RUN ln -s /usr/local/bin/nvim-linux64/bin/nvim /usr/local/bin/nvim

# Open a few ports 4200 to 4205
EXPOSE 4200 4201 4202 4203 4204 4205

# Add 'ubuntu' user to the sudo group
# Exec as root -> passwd ubuntu -> then you can run sudo since you have a password.
RUN usermod -aG sudo ubuntu

# Run all remaining commands as the 'ubuntu' user
USER ubuntu

# Install NVChad.
RUN git clone https://github.com/NvChad/starter /home/ubuntu/.config/nvim
RUN printf "local o = vim.o\no.expandtab = true\no.softtabstop = 4\no.shiftwidth = 4" >> /home/ubuntu/.config/nvim/lua/options.lua

# Download and init my dotfiles.
RUN git clone https://github.com/ManBearPigg/Dotfiles.git
RUN chmod +x Dotfiles/set_dotfiles.sh
RUN bash Dotfiles/set_dotfiles.sh
RUN rm -rf Dotfiles

# Default command to run once the container starts
CMD ["bash"]
