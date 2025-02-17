{...}: {
  services.radarr = {
    enable = true;
    group = "media";
    openFirewall = true;
  };
}
