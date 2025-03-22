{...}: {
  services.glance = {
    enable = true;
    openFirewall = true;
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
        {
          name = "Home";
          columns = [
            {
              size = "small";
              widgets = [
                {type = "calendar";}
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "group";
                  widgets = [
                    {type = "hacker-news";}
                    {type = "lobsters";}
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
}
