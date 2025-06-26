{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; lib.mkIf config.profiles.productivity.enable [rnote];
}
