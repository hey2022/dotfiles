{ pkgs, ... }:
let
  aspell = pkgs.aspellWithDicts (
    dicts: with dicts; [
      en
    ]
  );
in
{
  home.packages = [ aspell ];
  home.file.".aspell.conf".text = "dict-dir ${aspell}/lib/aspell";
}
