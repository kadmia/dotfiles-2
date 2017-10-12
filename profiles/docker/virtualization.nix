{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      # package = pkgs.docker_17_06;
      enable = true;
      liveRestore = false;
      logDriver = "json-file";
      listenOptions = [ "/var/run/docker.sock" "0.0.0.0:2375" ];
      extraOptions = ''
        --insecure-registry db-docker-fxcore.artifactory.danskenet.net --log-opt max-size=1M --log-opt max-file=1
      '';
    };
    virtualbox = {
      host.enable = true;
      guest.enable = false;
    };
  };

  nixpkgs.config.virtualbox.enableExtensionPack = false;
}
