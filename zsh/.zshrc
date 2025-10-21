eval "$(ssh-agent -s)" >/dev/null 2>&1
ssh-add ~/.ssh/github >/dev/null 2>&1
eval "$(starship init zsh)"

# fzf color palette
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
export COLORTERM="truecolor"
export PATH="$PATH:$HOME/.config/scripts/:$HOME/go/bin/"

#### STARTS DOTFILES
# alias -- dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#### ENDS DOTFILES

#### STARTS autosuggestion
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "jeffreytse/zsh-vi-mode"

if ! zplug check; then
  zplug install
fi

zplug load
autoload -U compinit && compinit

HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
unsetopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

bindkey "^f" autosuggest-accept
bindkey "^e" autosuggest-execute
bindkey "^c" autosuggest-clear
bindkey "^w" autosuggest-fetch
# bindkey "^" autosuggest-disable
# bindkey "^" autosuggest-enable
# bindkey "^" autosuggest-toggle

#### ENDS autosuggestion

alias -- SystemEdit='nvim ~/workspace/flake'
alias -- SystemUpdate='sudo nixos-rebuild switch --flake ~/workspace/flake#default'
alias -- StartWork='cd $(find ~/workspace/* -maxdepth 1 -mindepth 1 -type d | grep -v "mish" | grep -v "flake" | fzf) && nix develop -c $SHELL'
alias -- StartWorkInsecure='cd $(find ~/workspace/* -maxdepth 1 -mindepth 1 -type d | grep -v "mish" | grep -v "flake" | fzf) && NIXPKGS_ALLOW_INSECURE=1 nix develop --impure -c $SHELL'
alias -- StartNixploit='cd ~/workspace/otaleghani/nixploit/ && nix develop -c $SHELL'
alias -- cat=bat
alias -- vim=nvim
alias -- ls=eza
alias -- InstallUbuntu='qemu-img create -f qcow2 ~/ubuntu_disk.qcow2 30G && \
  mkdir -p ~/share && \
  qemu-system-x86_64 \
  -enable-kvm \
  -m 16G \
  -cpu host \
  -smp 4 \
  -boot d \
  -cdrom ~/truenas/vault/Iso/ubuntu-25.04-desktop-amd64.iso \
  -hda ubuntu_disk.qcow2 \
  -device virtio-vga-gl \
  -display gtk,gl=on \
  -device virtio-net-pci,netdev=user.0 \
  -netdev user,id=user.0 \
  -virtfs local,path=./share,mount_tag=host_share,security_model=passthrough'
alias -- StartUbuntu=' qemu-system-x86_64 \
  -enable-kvm \
  -m 16G \
  -cpu host \
  -smp 4 \
  -hda ~/ubuntu_disk.qcow2 \
  -device virtio-vga-gl \
  -display gtk,gl=on \
  -device virtio-net-pci,netdev=user.0 \
  -netdev user,id=user.0 \
  -virtfs local,path=/home/oliviero/workspace,mount_tag=host_share,security_model=mapped-xattr'
alias -- StartUbuntuWithAudio='qemu-system-x86_64 \
  -enable-kvm \
  -m 16G \
  -cpu host \
  -smp 4 \
  -hda ~/ubuntu_disk.qcow2 \
  -device ich9-intel-hda \
  -device hda-output \
  -device virtio-vga-gl \
  -display gtk,gl=on \
  -device virtio-net-pci,netdev=user.0 \
  -netdev user,id=user.0 \
  -virtfs local,path=/home/oliviero/workspace,mount_tag=host_share,security_model=mapped-xattr'
