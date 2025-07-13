
function mkcd --wraps mkdir
  command mkdir -p $argv
  if test $status = 0
    if test (builtin count $argv) = 1
      builtin cd $argv
      return
    end
  end
end
