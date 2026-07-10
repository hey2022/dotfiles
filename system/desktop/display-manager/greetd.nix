{ lib, pkgs, ... }:

{
  services.greetd.settings = {
    initial_session = {
      command = "${lib.getExe pkgs.uwsm} start -e -D Hyprland hyprland.desktop";
      user = "yiheng";
    };
  };
}
