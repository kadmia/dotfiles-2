{ config, pkgs, ... }:

{
  fonts = {
    enableCoreFonts = false;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      dejavu_fonts
      iosevka
      powerline-fonts
      terminus_font
    ];
  };
}
