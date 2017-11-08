{ config, pkgs, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.gfxmodeBios = "800x600";
  boot.kernelParams = [ "nomodeset" "vga=0x317" ];
  boot.kernel.sysctl = { "vm.max_map_count" = 262144; };

  environment.variables.HTTP_PROXY = "http://127.0.0.1:3128/";
  environment.variables.HTTPS_PROXY = "http://127.0.0.1:3128/";

  networking = {
    hostName = "phoenix";
    domain = "danskenet.net";
    search = [ "danskenet.net" ];
    proxy.default = "http://127.0.0.1:3128/";
    firewall.enable = false;
    networkmanager.enable = false;
  };

  services.cntlm = {
    enable = true;
    username = "user";
    password = "password";
    domain = "domain";
    proxy = [ "10.81.220.156:80" ];
    extraConfig = ''
      NoProxy *.danskenet.net phoenix
    '';
  };

  i18n = {
    consoleFont = "latarcyrheb-sun16";
    # consoleFont = "sun12x22";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  users.extraUsers = lib.singleton {
    name = "user";
    isNormalUser = true;
    home = "/home/user";
    description = "Phoenix User";
    extraGroups = [ "wheel" "docker" "vboxusers" ];
    initialPassword = "user";
    shell = "/run/current-system/sw/bin/zsh";
  };

  virtualisation.docker = {
    enable = true;
    liveRestore = false;
    logDriver = "json-file";
    listenOptions = [ "/var/run/docker.sock" "0.0.0.0:2375" ];
    extraOptions = ''
      --insecure-registry db-docker-fxcore.artifactory.danskenet.net --log-opt max-size=1M --log-opt max-file=1
    '';
  };

  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull
    vim
    oh-my-zsh
    zsh
    tmux
    tree
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  programs.zsh.interactiveShellInit = ''
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
    ZSH_THEME="afowler"
    export EDITOR='vim'
    export VISUAL='vim'
    HISTFILE=$HOME/.zhistory
    setopt extendedhistory
    plugins=(git git-extras colored-man-pages docker github tmux)
    source $ZSH/oh-my-zsh.sh
  '';

  programs.zsh.promptInit = ""; # Clear this to avoid a conflict with oh-my-zsh

  nixpkgs.config.virtualbox.enableExtensionPack = true;
  virtualisation.virtualbox = {
    host.enable = false;
    guest.enable = true;
  };

  nix.useSandbox = true;

  time.timeZone = "Europe/Copenhagen";
  system.stateVersion = "17.09";
}
