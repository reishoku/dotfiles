
function cal --wraps cal
  if path is -fx '/opt/homebrew/opt/util-linux/bin/cal'
    command /opt/homebrew/opt/util-linux/bin/cal $argv
  else
    command cal $argv
  end
end
