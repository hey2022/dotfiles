{pkgs, ...}: {
  home.packages = [
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
