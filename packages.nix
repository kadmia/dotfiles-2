{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl htop gksu inetutils
    zip unzip dbus dbus_daemon xclip
    # Internet
    chromium hexchat slack dropbox qbittorrent
    # Office
    libreoffice texlive.combined.scheme-full
    evince poppler_utils taskwarrior tasksh
    # Stuff
    cmatrix xscreensaver
    # File systems
    ntfs3g exfat
    # Security
    veracrypt keepass gnupg
    keybase keybase-gui kbfs
    # Data
    octaveFull graphviz gnuplot
    # Multimedia
    vlc exif ffmpeg gphoto2 youtube-dl
  ];
}
