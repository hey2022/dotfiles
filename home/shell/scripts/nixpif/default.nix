{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "nixpif";
      runtimeInputs = with pkgs; [
        coreutils
        curl
        jq
        nixfmt-rfc-style
        unzip
      ];
      text = builtins.readFile ./nixpif.sh;
    })
  ];
}
