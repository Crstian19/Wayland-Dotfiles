#eval "$(starship init zsh)"

export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket

# Automatically start sway
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=sway
  export NO_AT_BRIDGE=1
  export MOZ_ENABLE_WAYLAND=true
  export _JAVA_AWT_WM_NONREPARENTING=1
  #export QT_QPA_PLATFORM=wayland-egl
  export QT_QPA_PLATFORMTHEME=qt5ct
  export QT_FONT_DPI=96
  exec sway -D noatomic
fi

freshfetch | lolcat
alias ssh="TERM=xterm-256color ssh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias yay="paru"
alias server="ssh server.lan"
alias ls="exa"
alias lt="exa --tree"
alias la="exa -la"

