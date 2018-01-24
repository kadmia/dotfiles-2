{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      # xkbOptions = "eurosign:e";
      startDbusSession = true;
      displayManager.lightdm.enable = true;
      desktopManager.enlightenment.enable = true;
      synaptics = {
        enable = true;
        twoFingerScroll = true;
      };
    };
  };
}
