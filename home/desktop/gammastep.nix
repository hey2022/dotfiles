_: {
  services.gammastep = {
    temperature = {
      day = 6500;
      night = 4500;
    };
    provider = "manual";
    latitude = 23.021;
    longitude = 113.752;
    settings = {
      general = {
        fade = 1;
        gamma = 0.8;
        adjustment-method = "wayland";
      };
    };
  };
}
