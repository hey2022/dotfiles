{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = lib.mkIf config.profiles.education.enable [
    (pkgs.writeShellApplication {
      name = "ap-dl";
      runtimeInputs = with pkgs; [
        coreutils
        gnugrep
        wget
      ];
      text = builtins.readFile ./ap-dl.sh;
    })
  ];
}
