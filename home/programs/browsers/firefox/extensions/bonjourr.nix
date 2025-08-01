{ pkgs, ... }:

let
  addons = import ../addons { inherit pkgs; };
in
{
  packages = [ addons.bonjourr ];
}
