{
  config,
  pkgs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      cargo
      cargo-update
      mold-wrapped
      rust-analyzer
      rustc
      cargo-binstall
    ];
    file.".cargo/config.toml".source = config.lib.hm.mkFlakeSymlink ./config.toml;
    sessionPath = [ "$HOME/.cargo/bin" ];
  };
}
