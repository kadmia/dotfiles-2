{ config, pkgs, ... }:

{
  imports = [
    ./haskell.nix
  ];
  environment.systemPackages = with pkgs; [
    ghc80Env
    # ghc80ProfEnv
    # ghc82Env
    # ghc82ProfEnv
  ];
}
