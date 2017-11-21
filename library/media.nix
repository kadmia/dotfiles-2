{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    smplayer
    exif
    ffmpeg
    gphoto2
    youtube-dl
  ];
}
