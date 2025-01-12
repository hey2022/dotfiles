{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rust-analyzer
    cargo
    rustc
  ];
}
