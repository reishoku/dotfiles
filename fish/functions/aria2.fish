
if command -sq aria2c
  function aria2c --wraps aria2c
    command aria2c \
      -x 16 \
      -s 16 \
      -j 16 \
      $argv
  end
end
