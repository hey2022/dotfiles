{ config, ... }:
{
  services.skwd-deck.enable = true;
  # HACK: https://github.com/liixini/skwd-wall/issues/115
  xdg.configFile."skwd-wall-v2/config.json".source = ./config.json;
}
