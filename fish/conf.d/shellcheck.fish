
if command -sq shellcheck
  set -e SHELLCHECK_OPTS
  set -gx --prepend SHELLCHECK_OPTS \
    '--shell=bash' \
    '--exclude=SC1040'
end
