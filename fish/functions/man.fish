
function man --wraps man

  set -fx BAT_PAGING 'auto'

  command man $argv
end
