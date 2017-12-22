{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    haskell.compiler.ghc821
    cabal-install
    cabal2nix
  ];
}
