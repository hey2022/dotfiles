{ pkgs-local, ... }:
{
  services.uuplugin = {
    package = pkgs-local.uuplugin;
  };
}
