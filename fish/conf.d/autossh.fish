
if command -sq autossh
  set -gx AUTOSSH_PORT 0
  set -gx AUTOSSH_LOGLEVEL 0
  set -gx AUTOSSH_LOGFILE $HOME/.autossh.log
end
