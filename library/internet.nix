{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox-bin
    chromium
    slack
    weechat
  ];
}
