{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libreoffice
    texlive.combined.scheme-full
    evince
    poppler_utils
    taskwarrior
    tasksh
  ];
}
