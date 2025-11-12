{
  services.wayvnc = {
    enable = true;
    autoStart = true;
    settings = {
      address = "localhost";
      port = 5901;
    };
  };
}
