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
  services.homepage-dashboard.services.media.navidrome = {
    icon = "navidrome.svg";
    href = "http://localhost:4533";
  };
}
