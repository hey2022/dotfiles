{pkgs, ...}: let
  datascience = with pkgs.python3Packages; [
    jupyterlab
    matplotlib
    numpy
    pandas
    scikit-learn
    scipy
    seaborn
  ];
in {
  home.packages = with pkgs; [
    (python3.withPackages (python: datascience))
    basedpyright
    uv
    ruff
  ];
}
