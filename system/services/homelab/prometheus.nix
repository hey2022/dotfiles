{
  services.prometheus = {
    globalConfig.scrape_interval = "15s";
    scrapeConfigs = [
      {
        job_name = "node_exporter";
        static_configs = [
          {
            targets = [
              "desktop.taila6842.ts.net:9100"
              "goon.taila6842.ts.net:9100"
              "x1c12.taila6842.ts.net:9100"
            ];
          }
        ];
      }
      {
        job_name = "harmonia";
        static_configs = [
          {
            targets = [ "cache.hey2022.dev" ];
          }
        ];
      }
    ];
  };
}
