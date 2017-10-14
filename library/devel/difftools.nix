{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    meld
  ];
}
