{
  services.gammastep = {
    provider = "manual";
    # Coordinate precision https://xkcd.com/2170/
    latitude = 23.0;
    longitude = 113.8;
    settings = {
      general = {
        fade = 1;
        adjustment-method = "wayland";
      };
    };
  };
}
