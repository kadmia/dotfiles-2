{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    hexchat
    slack
    dropbox
    qbittorrent
  ];
}
