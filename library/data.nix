{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    octaveFull
    graphviz
    gnuplot
  ];
}
