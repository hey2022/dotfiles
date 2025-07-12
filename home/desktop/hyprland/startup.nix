{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.wayland.windowManager.hyprland;
  uwsm = if cfg.uwsm then "uwsm app --" else "";
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once =
      with lib;
      with pkgs;
      [
        "[workspace 1 silent] ${uwsm} ${getExe config.programs.zen-browser.package}"
        "[workspace 2 silent] ${uwsm} ${getExe' config.programs.emacs.package "emacsclient"} -c"
        "[workspace 10 silent] ${uwsm} ${getExe keepassxc}"
        "[workspace 10 silent] ${uwsm} ${getExe clash-verge-rev}"
        "[workspace special:scratchpad silent] ${uwsm} ${lib.getExe cfg.term}"
      ];
  };
}
