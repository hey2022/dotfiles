{pkgs, ...}: {
  home.packages = with pkgs; [goverlay];
  programs.mangohud = {
    enable = true;
  };
}
