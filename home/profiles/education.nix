{
  inputs,
  pkgs,
  ...
}: {
  imports = [../programs/email.nix ../programs/productivity ../programs/dictionary.nix ../programs/anki.nix ../programs/calculator.nix];
  home.packages = [
    inputs.tls-xb.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
