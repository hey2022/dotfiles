{pkgs, ...}: {
  home.packages = with pkgs; [
    (python3.withPackages (python: with python; [numpy pandas matplotlib scipy]))
  ];
}
