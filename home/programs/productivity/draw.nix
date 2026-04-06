{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = lib.mkIf config.profiles.productivity.enable [ pkgs.xournalpp ];
}
