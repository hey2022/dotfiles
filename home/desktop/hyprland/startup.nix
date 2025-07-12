{ config, ... }:

let
  cfg = config.wayland.windowManager.hyprland;
  uwsm = if cfg.uwsm then "uwsm-app --" else "";

in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1 silent] ${uwsm} zen-beta"
      "[workspace 2 silent] ${uwsm} emacsclient -c"
      "[workspace 10 silent] ${uwsm} keepassxc"
      "[workspace 10 silent] ${uwsm} clash-verge"
      "[workspace special:scratchpad silent] ${uwsm} $term"
    ];
  };
}
