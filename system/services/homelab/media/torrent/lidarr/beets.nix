{
  config,
  lib,
  pkgs,
  ...
}:

let
  beetsImport = pkgs.writeShellApplication {
    name = "beets-import.sh";
    runtimeInputs = with pkgs; [
      beets
      ffmpeg
    ];
    text = builtins.readFile ./beets-import.sh;
  };
in
{
  config = lib.mkIf config.services.lidarr.enable {
    system.activationScripts.beetsImport = ''
      mkdir -p /var/lib/lidarr/.config/Lidarr
      cp ${lib.getExe beetsImport} /var/lib/lidarr/.config/Lidarr/beets-import.sh
    '';
  };
}
