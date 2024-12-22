{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.writeShellApplication {
      name = "wclicker";
      runtimeInputs = with pkgs; [ydotool];
      text = builtins.readFile ./wclicker.sh;
    })
  ];
  wayland.windowManager.sway.extraConfig = lib.mkIf config.wayland.windowManager.sway.enable (lib.mkAfter ''
    mode "game" {
        # https://www.github.com/swaywm/sway/issues/5333
        # bindsym --whole-window --no-repeat button2 exec wclicker 20
        # bindsym --whole-window --release --no-repeat button2 exec pkill wclicker

        bindsym --no-repeat alt_l exec pkill wclicker || wclicker 20

        bindsym $mod+escape exec pkill wclicker; mode "default"
    }

    bindsym $mod+g mode "game"
  '');
}
