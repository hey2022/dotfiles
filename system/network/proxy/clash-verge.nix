{config, ...}: {
  programs.clash-verge = {
    enable = true;
    serviceMode = false;
    tunMode = true;
  };
  # HACK: https://nixpk.gs/pr-tracker.html?pr=420530
  systemd.services.clash-verge = {
    enable = true;
    description = "Clash Verge Service Mode";
    serviceConfig = {
      ExecStart = "${config.programs.clash-verge.package}/bin/clash-verge-service";
      Restart = "on-failure";
    };
    wantedBy = ["multi-user.target"];
  };
}
