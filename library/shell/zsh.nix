{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-zsh
    zsh
  ];

  # shell
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  programs.zsh.interactiveShellInit = ''
    export PATH="$PATH:$HOME/.local/bin:$HOME/.scripts"
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
    # Customize your oh-my-zsh options here
    ZSH_THEME="afowler"
    export EDITOR='vim'
    export VISUAL='vim'
    HISTFILE=$HOME/.zhistory
    # setopt sharehistory
    setopt extendedhistory
    plugins=(git git-extras colored-man-pages docker github tmux taskwarrior)
    source $ZSH/oh-my-zsh.sh
    source /etc/nixos/.dotfiles/.bashrc
    source $HOME/.scripts/ssh-start.sh
    zz () { root=$("$HOME/.scripts/zz.sh" "$1") && cd "$root" }
  '';

  programs.zsh.promptInit = ""; # Clear this to avoid a conflict with oh-my-zsh

  environment.shellAliases = {
    gvim = "vim -g -geometry=500x500";
  };

  environment.variables = {
    TERM = "xterm-256color";
  };
}
