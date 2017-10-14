{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vlc
    exif
    ffmpeg
    gphoto2
    youtube-dl
  ];
}
