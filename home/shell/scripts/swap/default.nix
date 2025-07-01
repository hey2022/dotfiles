{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "swap";
      text = builtins.readFile ./swap.sh;
    })
  ];
}
