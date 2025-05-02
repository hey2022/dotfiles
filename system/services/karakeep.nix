{...}: {
  services.karakeep = {
    enable = true;
    extraEnvironment = {
      PORT = "9000";
    };
  };
}
