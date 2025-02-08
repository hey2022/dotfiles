{...}: {
  services.homepage-dashboard = {
    enable = true;
    services = [
      {
        "*arr" = [
          {
            "prowlarr" = {
              href = "http://localhost:9696";
            };
          }
          {
            "radarr" = {
              href = "http://localhost:7878";
            };
          }
          {
            "sonarr" = {
              href = "http://localhost:8989";
            };
          }
          {
            "lidarr" = {
              href = "http://localhost:8686";
            };
          }
        ];
      }
    ];
  };
}
