
if isatty stdout; and status --is-interactive
  set -gx GPG_TTY (command tty)
end
