{
  config,
  lib,
  ...
}:
let
  cfg = config.services.glance;
in
{
  services.glance = {
    enable = true;
    settings = {
      server = {
        port = 5678;
        host = "0.0.0.0";
      };
      theme = {
        background-color = "240 21 15";
        contrast-multiplier = 1.2;
        primary-color = "217 92 83";
        positive-color = "115 54 76";
        negative-color = "347 70 65";
      };
      pages = [
        (lib.mkIf config.services.homepage-dashboard.enable {
          name = "Homepage";
          columns = [
            {
              size = "full";
              widgets = [
                {
                  title = "Homepage";
                  title-url = "https://gethomepage.dev";
                  type = "iframe";
                  source = "https://homepage.${config.host.address}";
                  height = 800;
                }
              ];
            }
          ];
        })
        {
          name = "Feed";
          columns = [
            {
              size = "small";
              widgets = [
                { type = "calendar"; }
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "group";
                  widgets = [
                    { type = "hacker-news"; }
                    { type = "lobsters"; }
                  ];
                }
              ];
            }
            {
              size = "small";
              widgets = [
                {
                  type = "weather";
                  location = "Dongguan, China";
                  units = "metric";
                }
              ];
            }
          ];
        }
      ];
    };
  };
  homelab.rootService = cfg.settings.server.port;
}
