{ lib, pkgs, ... }:

let
  beetsSettings = import ../../../../../common/beets.nix { };
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
  environment.etc."beets/config.yaml".source =
    (pkgs.formats.yaml { }).generate "config.yaml"
      beetsSettings;
  system.activationScripts.beetsImport = ''
    mkdir -p /var/lib/lidarr/.config/Lidarr
    cp ${lib.getExe beetsImport} /var/lib/lidarr/.config/Lidarr/beets-import.sh
  '';
}
