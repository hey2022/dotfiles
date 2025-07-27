{
  config,
  lib,
  pkgs,
  ...
}:

let
  beetsSettings = {
    directory = "${config.homelab.mediaDir}/music";
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
  config = lib.mkIf config.homelab.enable {
    environment = {
      systemPackages = with pkgs; [
        beets
        ffmpeg
      ];
      etc."beets/config.yaml".source = (pkgs.formats.yaml { }).generate "config.yaml" beetsSettings;
    };
  };
}
