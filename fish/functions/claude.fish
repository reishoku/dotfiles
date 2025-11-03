
function claude --wraps claude
  set -fx DISABLE_TELEMETRY 'true'
  set -fx DISABLE_ERROR_REPORTING 'true'
  set -fx DISABLE_BUG_COMMAND 'true'
  command claude $argv
end
