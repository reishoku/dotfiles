
set -gx XDG_CONFIG_HOME $HOME/.config

fish_add_path -P -m --prepend /usr/local/go/bin
fish_add_path -P -m --prepend $HOME/.local/npm/bin
fish_add_path -P -m --prepend $HOME/.local/gem/bin
fish_add_path -P -m --prepend $HOME/.cargo/bin
fish_add_path -P -m --prepend $HOME/.local/sbin
fish_add_path -P -m --prepend $HOME/.local/bin
