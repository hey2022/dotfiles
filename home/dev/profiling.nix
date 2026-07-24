{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.profiles.dev.enable {
    home.packages = with pkgs; [
      flamegraph
      hotspot
      hyperfine
      perf
      strace
    ];
  };
}
