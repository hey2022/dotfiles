{ pkgs, ... }:

{
  home.packages = [
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
