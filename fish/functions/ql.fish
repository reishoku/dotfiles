
function ql --description 'QuickLook'
  if command -sq qlmanage
    command qlmanage -p $argv > /dev/null 2>&1
  end
end
