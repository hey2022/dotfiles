{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./wayvnc.nix ];
  home.packages = with pkgs; [
    tigervnc
  ];
}
