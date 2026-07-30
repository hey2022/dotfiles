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
  beetsSettings = {
    directory = "${config.profiles.homelab.mediaDir}/music";
    library = "/etc/beets/library.db";
    import.hardlink = true;
    plugins = [
      "replaygain"
      "scrub"
      "chroma"
      "fromfilename"
      "fetchart"
      "permissions"
    ];

    replaygain.backend = "ffmpeg";

    ui.color = true;

    paths = {
      default = "$albumartist/$album/$track $title";
      singleton = "Singletons/$artist - $title";
      comp = "$genre/$album/$track $title";
      "albumtype:soundtrack" = "Soundtracks/$album/$track $title";
    };

    match = {
      strong_rec_thresh = 0.10;
    };

    permissions = {
      dir = 775;
      file = 664;
    };
  };
in
{
  config = lib.mkIf config.services.lidarr.enable {
    system.activationScripts.beetsImport = ''
      mkdir -p /var/lib/lidarr/.config/Lidarr
      cp ${lib.getExe beetsImport} /var/lib/lidarr/.config/Lidarr/beets-import.sh
    '';
    environment = {
      systemPackages = with pkgs; [
        beets
        ffmpeg
      ];
      etc."beets/config.yaml".source = (pkgs.formats.yaml { }).generate "config.yaml" beetsSettings;
    };
  };
}
