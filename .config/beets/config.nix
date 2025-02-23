{
  directory = "/var/lib/media/music";
  library = "/etc/beets/library.db";
  import.move = true;
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

  permissions = {
    dir = 775;
    file = 664;
  };
}
