{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
    basedpyright
    uv
    ruff
  ];
}
