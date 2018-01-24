{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    enlightenment.terminology
  ];
}
