{pkgs, ...}: {
  home.packages = with pkgs; [
    feishin
    songrec
    spotube
  ];
  # https://github.com/NixOS/nixpkgs/pull/397918
  nixpkgs.config.permittedInsecurePackages = [
    "electron-33.4.11"
  ];
}
