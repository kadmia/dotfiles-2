{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    evince
    poppler_utils
    taskwarrior
    tasksh
    shutter
    obs-studio
    gtk-recordmydesktop
    simplescreenrecorder
  ];
}
