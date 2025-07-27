{
  config,
  lib,
  ...
}:

let
  cfg = config.wayland.windowManager.hyprland;
  uwsm = if cfg.uwsm then "uwsm app --" else "";
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1 silent] ${uwsm} zen-beta"
      "[workspace 2 silent] ${uwsm} emacsclient -c"
      "[workspace 9 silent] ${uwsm} wechat-uos"
      "[workspace 9 silent] ${uwsm} thunderbird"
      "[workspace 9 silent] ${uwsm} element-desktop"
      "[workspace 9 silent] ${uwsm} vesktop"
      "[workspace 10 silent] ${uwsm} keepassxc"
      "[workspace 10 silent] ${uwsm} clash-verge"
      "[workspace special:scratchpad silent] ${uwsm} ${lib.getExe cfg.term}"
    ];
  };
}
