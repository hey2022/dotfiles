{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    duf
    fastfetch
    lm_sensors
    s-tui
  ];
}
