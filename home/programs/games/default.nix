{pkgs, ...}: {
  imports = [./minecraft];
  home.packages = with pkgs; [mindustry];
}
