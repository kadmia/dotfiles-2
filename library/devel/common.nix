{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull
    gnumake
    binutils
    jq
    tree
    file
    meld
    sublime3
  ];
}
