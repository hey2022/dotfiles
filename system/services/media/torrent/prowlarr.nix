{...}: {
  services.prowlarr = {
    enable = true;
  };
  services.homepage-dashboard.services.media.prowlarr = {
    href = "http://localhost:9696";
  };
}
