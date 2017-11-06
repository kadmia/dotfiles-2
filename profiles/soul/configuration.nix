{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./bootloader.nix
      ./library/devel/common.nix
      ./library/docker/default.nix
      ./library/dotfiles/default.nix
      ./library/filesystems.nix
      ./library/fonts.nix
      ./library/internet.nix
      ./library/kernel.nix
      ./library/media.nix
      ./library/networking/default.nix
      ./library/office/common.nix
      ./library/screensavers.nix
      ./library/security/default.nix
      ./library/shell/tmux.nix
      ./library/shell/zsh.nix
      ./library/users.nix
      ./library/utils.nix
      ./library/vim/developer.nix
      ./library/virtualbox/host.nix
      ./library/x/common.nix
      ./library/x/xfce.nix
    ];

  nix.useSandbox = true;

  services.xserver.resolutions = [ { x = 1920; y = 1080; } ];

  nixpkgs.config = {
    allowUnfree = true;
    firefox.enableAdobeFlash = false;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "latarcyrheb-sun32";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # The NixOS release to be compatible with for stateful data such as databases.
  # system.stateVersion = "xx.xx";
}
