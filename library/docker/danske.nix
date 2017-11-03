{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker_compose
  ];
  virtualisation.docker = {
    enable = true;
    liveRestore = false;
    logDriver = "json-file";
    listenOptions = [ "/var/run/docker.sock" "0.0.0.0:2375" ];
    extraOptions = ''
      --insecure-registry db-docker-fxcore.artifactory.danskenet.net --log-opt max-size=1M --log-opt max-file=1
    '';
  };
}
