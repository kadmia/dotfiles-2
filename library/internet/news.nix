{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    liferea
  ];
}
