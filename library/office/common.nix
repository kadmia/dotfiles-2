{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    evince
    poppler_utils
    taskwarrior
    tasksh
  ];
}
