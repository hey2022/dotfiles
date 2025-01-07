{
  inputs,
  pkgs,
  ...
}: {
  imports = [../programs/email.nix ../programs/documents ../programs/inkscape.nix ../programs/dictionary.nix ../programs/anki.nix ../programs/calculator.nix];
  home.packages = [
    inputs.tls-xb.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
