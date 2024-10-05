{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./wayvnc.nix ];
  home.packages = with pkgs; [
    tigervnc
  ];

  wayland.windowManager.sway.extraConfig = lib.mkAfter ''
    mode passthrough {
        bindsym $mod+shift+p mode default; floating_modifier $mod normal
    }
    bindsym $mod+shift+p mode passthrough; floating_modifier none
  '';
}
