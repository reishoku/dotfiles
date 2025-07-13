
function man --wraps man

  set -lx BAT_PAGING 'auto'

  command man $argv
end
