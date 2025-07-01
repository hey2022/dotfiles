{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "nightgrade";
      text = builtins.readFile ./nightgrade.sh;
    })
  ];
}
