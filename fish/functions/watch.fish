
function watch --wraps watch
  set -fx WATCH_INTERVAL 1
  command watch -c -r -p --interval $WATCH_INTERVAL $argv
end
