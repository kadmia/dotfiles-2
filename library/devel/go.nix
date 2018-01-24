{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    go go2nix
  ];
}
