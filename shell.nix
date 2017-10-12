{ config, pkgs, ... }:

{
  imports =
    [ ./shell/zsh.nix
    ];

  environment.systemPackages = with pkgs; [
    tmux
  ];
}
