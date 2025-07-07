{
  inputs,
  config,
  pkgs,
  ...
}:

{
  sops.secrets.grip = {
    sopsFile = "${inputs.self}/secrets/grip";
    path = "${config.home.homeDirectory}/.grip/settings.py";
    format = "binary";
  };
  home.packages = with pkgs; [
    python3Packages.grip
  ];
}
