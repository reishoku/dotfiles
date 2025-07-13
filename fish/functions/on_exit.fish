
function on_exit --on-event fish_exit
  builtin history merge
end
