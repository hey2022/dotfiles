{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.wayland.windowManager.hyprland;
in
{
  options = {
    wayland.windowManager.hyprland = {
      uwsm.enable = lib.mkEnableOption "uwsm";
    };
  };
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      uwsm.enable = true;
      systemd.enable = !cfg.uwsm.enable;
      configType = "lua";
      extraLuaFiles = {
        "nix.lua" = {
          content = ''
            local nix = {
                uwsm = ${toString cfg.uwsm.enable},
                xresources_path = "${config.xresources.path}",
            }
            return nix
          '';
          autoLoad = false;
        };
        "config.lua" = {
          content = config.lib.hm.mkFlakeSymlink ./config.lua;
          autoLoad = false;
        };
        "lib.lua" = {
          content = config.lib.hm.mkFlakeSymlink ./lib.lua;
          autoLoad = false;
        };
        "autostart.lua" = {
          content = config.lib.hm.mkFlakeSymlink ./autostart.lua;
        };
        "binds.lua" = {
          content = config.lib.hm.mkFlakeSymlink ./binds.lua;
        };
        "wm.lua" = {
          content = config.lib.hm.mkFlakeSymlink ./wm.lua;
        };
        "rules.lua" = {
          content = config.lib.hm.mkFlakeSymlink ./rules.lua;
        };
        "settings.lua" = {
          content = config.lib.hm.mkFlakeSymlink ./settings.lua;
        };
      };
    };
    home.packages = with pkgs; [
      grimblast
      thunar
    ];
    programs = {
      espanso-config.enable = true;
      foot.enable = true;
      rofi.enable = true;
      uwsm.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
    };
    services = {
      cliphist.enable = true;
      hypridle.enable = true;
      hyprpolkitagent.enable = true;
      hyprsunset.enable = true;
      swaync.enable = true;
    };
  };
}
