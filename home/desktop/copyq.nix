{pkgs-stable, ...}: {
  services.copyq = {
    enable = true;
    # https://nixpk.gs/pr-tracker.html?pr=398926
    package = pkgs-stable.copyq;
  };
}
