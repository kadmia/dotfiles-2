{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nix-prefetch-git
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
