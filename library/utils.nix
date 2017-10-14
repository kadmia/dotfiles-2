{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    htop
    gksu
    inetutils
    zip
    unzip
    dbus
    dbus_daemon
    xclip
  ];
}
