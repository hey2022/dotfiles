{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "zjs";
      runtimeInputs = with pkgs; [
        zoxide
        coreutils
        zellij
      ];
      text = builtins.readFile ./zjs.sh;
    })
  ];
}
