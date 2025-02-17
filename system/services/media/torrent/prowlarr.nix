{...}: {
  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };
  services.homepage-dashboard.services.media.prowlarr = {
    icon = "prowlarr.svg";
    href = "http://localhost:9696";
  };
}
