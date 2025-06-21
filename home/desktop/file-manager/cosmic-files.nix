{pkgs, ...}: {
  home.packages = with pkgs; [
    cosmic-files
  ];
}
