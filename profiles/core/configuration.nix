{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./bootloader.nix
      ./library/devel/common.nix
      ./library/docker/danske.nix
      ./library/dotfiles/danske.nix
      ./library/filesystems.nix
      ./library/fonts.nix
      ./library/kernel.nix
      ./library/networking/danske.nix
      ./library/screensavers.nix
      ./library/shell/tmux.nix
      ./library/shell/zsh.nix
      ./library/users.nix
      ./library/utils.nix
      ./library/vim/default.nix
      ./library/virtualbox/guest.nix
      ./library/x/common.nix
      ./library/x/xfce.nix
    ];

  nix.useSandbox = true;

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
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # The NixOS release to be compatible with for stateful data such as databases.
  # system.stateVersion = "xx.xx";
}
