
if status --is-interactive
  if command -sq nvim
    set -gx EDITOR nvim
  else if command -sq vim
    set -gx EDITOR vim
  else if command -sq vi
    set -gx EDITOR vi
  end
  
  set -gx VISUAL      $EDITOR
  set -gx SUDO_EDITOR $EDITOR
  set -gx GIT_EDITOR  $EDITOR
end
