{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.profiles.productivity.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
