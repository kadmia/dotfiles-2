{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./bootloader.nix
      ./library/data.nix
      ./library/devel/common.nix
      ./library/devel/dotnet.nix
      ./library/devel/elm.nix
      ./library/devel/haskell82.nix
      ./library/devel/java.nix
      ./library/devel/nix.nix
      ./library/docker/default.nix
      ./library/dotfiles/default.nix
      ./library/filesystems.nix
      ./library/fonts.nix
      ./library/internet.nix
      ./library/kernel.nix
      ./library/media.nix
      ./library/networking/default.nix
      ./library/office/common.nix
      ./library/office/libreoffice.nix
      ./library/office/texlive.nix
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

  services.xserver.displayManager.sessionCommands = ''
    xrandr --output eDP-1 --scale 0.5x0.5
  '';

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
