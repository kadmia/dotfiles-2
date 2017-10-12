{ config, pkgs, ... }:

let
  global = (import ./global.nix);
in
{
  system.activationScripts = {
    scriptsSetup = {
      text = ''
        ${pkgs.rsync}/bin/rsync -rav /etc/nixos/.dotfiles/ /home/${global.userName}/
        chown -R ${global.userName}:users /home/${global.userName}
      '';
      deps = [ "users" ];
    };
  };
}
