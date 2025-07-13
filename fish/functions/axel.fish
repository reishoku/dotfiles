
if command -sq axel
  function axel --wraps axel
    command axel \
      -c \
      -n16 \
      $argv
  end
end
