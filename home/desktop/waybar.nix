{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ../font ];
  home.packages = with pkgs; [ waybar ];
  home.file.".config/waybar" = {
    source = ../../.config/waybar;
    recursive = true;
  };
}
