{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    texlive.combined.scheme-full
  ];
  networking.extraHosts = ''
    146.185.144.154 lipa.ms.mff.cuni.cz
  '';
}
