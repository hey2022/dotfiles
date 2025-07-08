{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = lib.mkIf config.profiles.education.enable [
    (pkgs.writeShellApplication {
      name = "gfm";
      runtimeInputs = with pkgs; [
        comrak
        coreutils
        nodePackages.live-server
        pandoc
      ];
      text = builtins.readFile ./gfm.sh;
    })
  ];
}
