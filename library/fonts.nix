{ config, pkgs, ... }:

{
  fonts = {
    enableCoreFonts = false;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      cantarell_fonts
      corefonts
      dejavu_fonts
      gohufont
      google-fonts
      gyre-fonts
      hack-font
      iosevka
      ipaexfont
      ipafont
      liberation_ttf
      nerdfonts
      oxygenfonts
      powerline-fonts
      profont
      proggyfonts
      terminus_font
      tewi-font
      ubuntu_font_family
    ];
  };
}
