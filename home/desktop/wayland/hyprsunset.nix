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
          time = "21:00";
          temperature = 5000;
        }
      ];
    };
  };
}
