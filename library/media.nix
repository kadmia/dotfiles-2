{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv smplayer
    exif
    ffmpeg
    gphoto2
    youtube-dl
  ];
}
