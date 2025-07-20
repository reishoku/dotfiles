
if command -sq qlmanage
  function ql --description 'QuickLook'
    command qlmanage -p $argv > /dev/null 2>&1
  end
end
