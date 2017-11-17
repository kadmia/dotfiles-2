{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    evince
    poppler_utils
    taskwarrior
    tasksh
    obs-studio
    gtk-recordmydesktop
    simplescreenrecorder
  ];
}
