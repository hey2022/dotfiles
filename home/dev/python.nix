{pkgs, ...}: let
  datascience = with pkgs.python3Packages; [
    matplotlib
    numpy
    pandas
    scikit-learn
    scipy
  ];
in {
  home.packages = with pkgs; [
    (python3.withPackages (python: datascience))
    basedpyright
    uv
    ruff
  ];
}
