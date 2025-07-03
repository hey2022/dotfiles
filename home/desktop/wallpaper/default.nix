{ pkgs, lib, ... }:
let
  wallpaper-updater = (
    pkgs.writeShellApplication {
      name = "wallpaper-updater";
      runtimeInputs = with pkgs; [
        coreutils
        git
      ];
      text = builtins.readFile ./wallpaper-updater.sh;
    }
  );
in
{
  services.swww.enable = true;
  home.packages = with pkgs; [
    waypaper
  ];
  systemd.user.services.wallpaper-updater = {
    Unit = {
      Description = "Update wallpaper collection";
      After = "network-online.target";
      Wants = "network-online.target";
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${lib.getExe wallpaper-updater}";
    };
  };
  home.activation.download-wallpapers = lib.hm.dag.entryAfter [ "reloadSystemd" ] ''
    $DRY_RUN_CMD ${lib.getExe' pkgs.systemd "systemctl"} --no-block --user start wallpaper-updater.service
  '';

}
