{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv
    exif
    ffmpeg
    gphoto2
    youtube-dl
    digikam
    pitivi
  ];
}
