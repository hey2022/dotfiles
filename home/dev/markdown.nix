{pkgs, ...}: {
  home.packages = with pkgs; [
    python311Packages.grip
    marksman
    mdl
  ];
}
