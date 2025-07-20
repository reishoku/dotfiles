
if not command -sq ssh-import-id
  if not command -sq uv
    # no-op
    :
  else
    function ssh-import-id
      command uv tool install -U 'ssh-import-id'; and \
        command ssh-import-id $argv
    end
  end
else
  function ssh-import-id --wraps ssh-import-id
    command ssh-import-id $argv
  end
end

