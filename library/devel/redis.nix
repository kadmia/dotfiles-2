{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    redis-desktop-manager
  ];
}
