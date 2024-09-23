{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.file.".local/share/fonts" = {
    source = ../../.local/share/fonts;
    recursive = true;
  };
}
