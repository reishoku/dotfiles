#!/usr/bin/env bash

function usage(){
  echo -e "gather-system-info.sh"
  echo -e "  [-h|--help]: Print this message and exit"
}

[[ -z "$1" || "$1" == "*help*" ]] && usage; exit 1
[[ -z "$1" || "$1" == "-h" ]] && usage; exit 1
[[ "$#" == 1 ]] && exit 0

# system check
command -v uname || echo "command \"uname\" not found. exiting."
if [ "$(uname -s)" == "Darwin" ]; then KERNEL_NAME="Darwin"; fi
if [ "$(uname -s)" == "Linux" ]; then KERNEL_NAME="Linux"; fi
if [ "$(uname -s)" == "FreeBSD" ]; then KERNEL_NAME="FreeBSD"; fi

# distribution type check
[[ "$KERNEL_NAME" == "Darwin" && test -x "sw_vers" ]] # this determines macOS (in most cases)
[[ "$KERNEL_NAME" == "Linux" && test -f "/etc/os-release" ]] && source "/etc/os-release"

