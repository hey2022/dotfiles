{
  inputs,
  pkgs,
  ...
}: {
  # TODO: refactor this into a proper profile
  imports = [../programs/email.nix ../programs/productivity ../programs/dictionary.nix ../programs/anki.nix ../programs/calculator.nix ../shell/scripts/ap-dl];
  home.packages = with pkgs; [
    zotero
    inputs.tls-xb.packages.${pkgs.system}.default
  ];
}
