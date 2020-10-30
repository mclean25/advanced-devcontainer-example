#!/bin/bash

# Copy this file and save as `config.sh` within the `.devcontainer` directory.

export temp_config_dir=.temp-config

# ------------------------
# Custom Settings
# ------------------------
# Add paths of files or directories relative to your $HOME folder in order to
# port them over to the dev container. Delimit paths by a single space.
# The placeholders here in this array are just examples and can be removed or
# edited.
export paths_to_port=(.zshrc .p10k.zsh .oh-my-zsh)

# Add commands to be run after the container has been built. The placeholders
# here can be removed or edited.
install_cmds() {
   apt-get install zsh -y
}