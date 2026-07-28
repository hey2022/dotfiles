{
  services.hyprsunset = {
    settings = {
      max-gamma = 200;
      profile = [
        {
          time = "05:00";
          identity = true;
        }
        {
          time = "18:00";
          temperature = 2700;
        }
        {
          time = "20:00";
          temperature = 1900;
        }
      ];
    };
  };
}
