
if isatty stdout; and status --is-interactive; and command -sq less

  set -gx LESS \
    '-igUR' \
    '--proc-tab' \
    '--tabs=1' \
    '--mouse' # \
    # '--use-color'

  if command -sq nkf
    set -gx LESSOPEN '|nkf --oc=UTF-8 %s'
  end
  if command -sq clear
    set -gx LESSCLOSE 'clear -x'
  end

  # manpages
  if command -sq bat
    # NOTE: do not set these variables as "global"
    set -lx MANPAGER \
      'bat --language=man --tabs=1 --style=plain --decorations=never --color=auto --strip-ansi=auto --pager="less -sR"'
    # 'bat --language=man --tabs=1 --paging=always --decorations=never --color=always --pager="less -r"'
    set -lx MANROFFOPT '-c'
  end
end
