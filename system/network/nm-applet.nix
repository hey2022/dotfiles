{pkgs, ...}: {
  programs.nm-applet = {
    enable = true;
  };
  environment.systemPackages = [pkgs.networkmanagerapplet];
}
