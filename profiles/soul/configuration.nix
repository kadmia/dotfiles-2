{ config, pkgs, ... }:

let
  global = (import ./global.nix);
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./bootloader.nix
      ./library/devel/common.nix
      ./library/devel/go.nix
      ./library/devel/haskell.nix
      ./library/docker/default.nix
      ./library/dotfiles/default.nix
      ./library/filesystems.nix
      ./library/fonts.nix
      ./library/internet/chat.nix
      ./library/internet/filesync.nix
      ./library/internet/browsers.nix
      ./library/kernel.nix
      ./library/media.nix
      ./library/networking/default.nix
      ./library/office/common.nix
      ./library/office/libreoffice.nix
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

  system.activationScripts = {
    asoundRc = {
      text = ''
        echo "pcm.!default {" > /home/${global.userName}/.asoundrc
        echo "  type hw" >> /home/${global.userName}/.asoundrc
        echo "  card 1" >> /home/${global.userName}/.asoundrc
        echo "}" >> /home/${global.userName}/.asoundrc
        echo "ctl.!default {" >> /home/${global.userName}/.asoundrc
        echo "  type hw" >> /home/${global.userName}/.asoundrc
        echo "  card 1" >> /home/${global.userName}/.asoundrc
        echo "}" >> /home/${global.userName}/.asoundrc
      '';
      deps = [ "users" ];
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
