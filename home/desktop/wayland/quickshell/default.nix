{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.quickshell;
in
{
  home.packages = with pkgs; [
    qt6Packages.qtmultimedia
  ];
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
    activeConfig = "default";
    configs = {
      default = config.lib.hm.mkFlakeSymlink ./default;
    };
  };
  home.activation.create-create-qmlls-config = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    for dir in ${lib.escapeShellArgs (lib.attrValues cfg.configs)}; do
      touch "$dir/.qmlls.ini"
    done
  '';
}
