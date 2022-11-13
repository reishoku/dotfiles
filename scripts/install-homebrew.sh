#!/usr/bin/env bash

export NONINTERACTIVE=1

sudo -v

# system check
[[ "$(uname -s)" != "Linux" ]] && echo "This system is not Linux apparently."; exit 1;
[[ -f "/etc/os-release" ]] && source /etc/os-release
[[ "$ID_LIKE" == "*debian*" ]] && \
(
  command -v sudo && \
    sudo apt-get install -y \
      --no-install-recommends --no-install-suggests \
      build-essential file curl git
)
[[ "$ID_LIKE" == "*fedora*" ]] && \
(
  # yum is deprecated; using dnf instead.
  command -v dnf && \
    sudo dnf install -y \
      "Development Tools" "Development Libraries" curl file git
)

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
