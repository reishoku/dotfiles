
function vnc
  if command -sq launchctl
    # We are likely running on macOS
    command open -a 'Screen Sharing' $argv
  end
end
