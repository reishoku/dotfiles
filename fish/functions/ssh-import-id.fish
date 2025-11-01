
if not command -sq ssh-import-id
  echo 'Could not find ssh-import-id in $PATH.'
  echo 'Run "uv tool install -U ssh-import-id" to install it.'
else
  command ssh-import-id $argv
end

