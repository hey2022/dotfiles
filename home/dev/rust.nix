{pkgs, ...}: {
  home.packages = with pkgs; [
    rust-analyzer
    cargo
    rustc
    cargo-update
  ];
}
