{...}: {
  services.prometheus = {
    enable = true;
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
