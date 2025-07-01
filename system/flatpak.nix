{ config, ... }:
{
  services.flatpak.enable = config.host.desktop;
}
