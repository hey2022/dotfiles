{
  inputs,
  pkgs,
  ...
}: {
  imports = [../programs/email.nix ../programs/productivity ../programs/dictionary.nix ../programs/anki.nix ../programs/calculator.nix];
  home.packages = with pkgs; [
    zotero
    inputs.tls-xb.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
