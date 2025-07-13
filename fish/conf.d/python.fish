
set -gx PYTHONDONTWRITEBYTECODE 'true'
set -gx PYTHONMALLOC ''
set -gx PYTHONASYNCDEBUG ''
set -gx PYTHONOPTIMIZE 2

if status --is-interactive
  set -gx PYTHON_COLORS 1
end
