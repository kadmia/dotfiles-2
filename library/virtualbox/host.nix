{ config, pkgs, ... }:

{
  nixpkgs.config.virtualbox.enableExtensionPack = false;
  virtualisation.virtualbox = {
    host.enable = true;
    guest.enable = false;
  };
}
