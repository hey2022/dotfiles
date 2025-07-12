{
  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
  };
  environment.sessionVariables = {
    https_proxy = "http://127.0.0.1:7897";
    http_proxy = "http://127.0.0.1:7897";
  };
}
