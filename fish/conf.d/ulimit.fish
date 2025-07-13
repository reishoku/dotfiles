
if command -sq launchctl
  # We are likely running on macOS
  builtin ulimit -n unlimited
end
