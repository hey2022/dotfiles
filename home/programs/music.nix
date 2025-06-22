{pkgs, ...}: {
  home.packages = with pkgs; [
    feishin
    songrec
    youtube-music
  ];
  # HACK: https://nixpk.gs/pr-tracker.html?pr=405530
  nixpkgs.config.permittedInsecurePackages = [
    "electron-33.4.11"
  ];
}
