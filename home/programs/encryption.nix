{pkgs, ...}: {
  home.packages = with pkgs; [
    age
    sops
    ssh-to-age
  ];
}
