{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    slack
    weechat
  ];
}
