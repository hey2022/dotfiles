{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ font-awesome ];
  home.file.".local/share/fonts" = {
    source = ../.local/share/fonts;
    recursive = true;
  };
}
