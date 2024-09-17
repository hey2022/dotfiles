{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.displayManager.ly = {
    enable = true;
  };
}
