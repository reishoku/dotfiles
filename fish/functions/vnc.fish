
function vnc
  if test $__fish_uname = 'Darwin'
    # We are likely running on macOS
    command open -a 'Screen Sharing' $argv
  end
end
