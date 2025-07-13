
if command -sq eza; and status --is-interactive
  set -gx __fish_ls_command eza
  set -gx indicators_opt
  if isatty stdout
    if test -n "$__fish_ls_color_opt"
      set -gx --prepend indicators_opt $__fish_ls_color_opt
    end
  end
  if test -n "$__fish_ls_indicators_opt"
    set -gx --prepend indicators_opt $__fish_ls_indicators_opt
  end
  if test -n "$__fish_eza_opt"
    set -gx --append indicators_opt $__fish_eza_opt
  end

  if test -n "$TERM_PROGRAM"; and test "$TERM_PROGRAM" = "Apple_Terminal"
    set -gx CLICOLOR 1
  end
  if test -z "$TERM_PROGRAM"
    set -gx CLICOLOR 1
  end

  function ls --wraps eza
    command \
      $__fish_ls_command \
      $indicators_opt \
      $argv
  end
else
    if test -z "$__fish_ls_command"
      set -gx __fish_ls_command /bin/ls
    else
      if not command -sq "$__fish_ls_command"
        set -gx __fish_ls_command /bin/ls
      end
    end

    if test -z "$__fish_ls_color_opt"
      set -gx __fish_ls_color_opt \
        '--color'
    end

    if test -z "$__fish_ls_indicators_opt"
      set -gx __fish_ls_indicators_opt \
        ''
    end

  if test -n "$TERM_PROGRAM"; and test "$TERM_PROGRAM" = "Apple_Terminal"
    set -gx CLICOLOR 1
  end
  if test -z "$TERM_PROGRAM"
    set -gx CLICOLOR 1
  end

  function ls --wraps eza
    command \
      $__fish_ls_command \
      $__fish_ls_color_opt \
      $__fish_ls_indicators_opt \
      $argv
  end
end

function ll --wraps eza
  ls -l $argv
end

function la --wraps eza
  ls -la $argv
end
