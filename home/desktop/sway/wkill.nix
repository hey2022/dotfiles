{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.writeShellApplication {
      name = "wkill";
      runtimeInputs = with pkgs; [
        sway
        jq
        util-linux
      ];
      text = ''
        PID=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true).pid')
        kill -9 "$PID"
      '';
    })
  ];
}
