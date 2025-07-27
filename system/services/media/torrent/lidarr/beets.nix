{ lib, pkgs, ... }:

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
  system.activationScripts.beetsImport = ''
    mkdir -p /var/lib/lidarr/.config/Lidarr
    cp ${lib.getExe beetsImport} /var/lib/lidarr/.config/Lidarr/beets-import.sh
  '';
}
