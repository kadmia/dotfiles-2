{ config, pkgs, ... }:

{
  nixpkgs.config.virtualbox.enableExtensionPack = true;
  virtualisation.virtualbox = {
    host.enable = false;
    guest.enable = true;
  };
}
