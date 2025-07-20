
if command -sq drill
  function drill --wraps drill
    command drill -Q \
      $argv
  end
end
