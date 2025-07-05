{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    cargo
    cargo-update
    mold-wrapped
    rust-analyzer
    rustc
    cargo-binstall
  ];
  home.file.".cargo/config.toml".source = config.lib.hm.mkFlakeSymlink ./config.toml;
}
