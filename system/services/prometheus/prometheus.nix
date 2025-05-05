{...}: {
  services.prometheus = {
    enable = true;
    globalConfig.scrape_interval = "15s";
    scrapeConfigs = [
      {
        job_name = "node_exporter";
        static_configs = [
          {
            targets = [
              "desktop:9100"
              "goon:9100"
            ];
          }
        ];
      }
    ];
  };
}
