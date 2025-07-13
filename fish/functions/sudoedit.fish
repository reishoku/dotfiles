
if not command -sq sudoedit
  function sudoedit
    command sudo -e $argv
  end
end
