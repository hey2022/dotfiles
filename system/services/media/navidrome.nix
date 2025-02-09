{...}: {
  services.navidrome = {
    enable = true;
    openFirewall = true;
    group = "media";
    settings = {
      Address = "0.0.0.0";
      MusicFolder = "/var/lib/media/music";
    };
  };
}
