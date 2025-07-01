{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.wireshark = lib.mkIf config.host.desktop {
    enable = true;
    package = pkgs.wireshark-qt;
  };
}
