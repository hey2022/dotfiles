{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ font-awesome ];
}
