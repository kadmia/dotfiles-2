{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libnotify

    gtk-engine-murrine
    adapta-gtk-theme
    flat-plat
    numix-gtk-theme
    paper-gtk-theme
    paper-icon-theme
    clearlooks-phenix
    elementary-icon-theme
    faba-icon-theme
    hicolor_icon_theme
    maia-icon-theme
    moka-icon-theme
    numix-icon-theme
    numix-icon-theme-circle
    numix-icon-theme-square
    tango-icon-theme
    theme-vertex
    zuki-themes

    # xfce.xfce4_cpufreq_plugin
    xfce.xfce4_systemload_plugin
    xfce.xfce4_xkb_plugin
    # xfce.xfce4_embed_plugin
    xfce.xfce4_battery_plugin
    # xfce.xfce4_verve_plugin
    # xfce.xfce4_notes_plugin
    # xfce.xfce4_dict_plugin
    xfce.xfce4_clipman_plugin
    xfce.xfce4_datetime_plugin
    # xfce.xfce4_netload_plugin
    # xfce.gigolo
    xfce.xfce4taskmanager
    # xfce.xfce4_cpugraph_plugin
    # xfce.xfce4_eyes_plugin
    # xfce.xfce4_fsguard_plugin
    xfce.xfce4_genmon_plugin
    # xfce.xfce4_weather_plugin
    # xfce.xfce4_whiskermenu_plugin
  ];
  services = {
    openssh.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
    xserver = {
      enable = true;
      layout = "us";
      # xkbOptions = "eurosign:e";
      startDbusSession = true;
      displayManager.lightdm.enable = true;
      desktopManager.xfce = {
        enable = true;
        thunarPlugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-dropbox-plugin
          thunar_volman
        ];
      };
      resolutions = [ { x = 1920; y = 1080; } ];
      synaptics = {
        enable = true;
        twoFingerScroll = true;
      };
    };
    udisks2.enable = true;
    dbus = {
      enable = true;
      packages = with pkgs; [ gnome3.dconf ];
    };
  };
}
