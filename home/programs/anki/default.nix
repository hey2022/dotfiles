{
  config,
  lib,
  pkgs,
  pkgs-local,
  ...
}:

{
  programs.anki = {
    enable = true;
    theme = "dark";
    profiles."User 1".sync = {
      usernameFile = config.sops.secrets."anki/username".path;
      keyFile = config.sops.secrets."anki/key".path;
      autoSync = true;
    };
    addons = with pkgs.ankiAddons; [
      anki-connect
      (anki-contanki.withConfig {
        config = lib.importJSON ./config/contanki.json;
        userFiles = ./user-files/anki-contanki;
      })
      (pkgs-local.anki-to-pdf.withConfig {
        userFiles = ./user-files/anki-to-pdf;
      })
      review-heatmap
      (fsrs4anki-helper.withConfig {
        config = lib.importJSON ./config/fsrs-helper.json;
      })
      pkgs-local.mds-time-left
      (ajt-card-management.withConfig {
        config = lib.importJSON ./config/ajt-card-management.json;
      })
      pkgs-local.anking-notes-addon
      pkgs-local.anki-stylusdraw
      (pkgs-local.search-stats-extended-bin.withConfig {
        config = lib.importJSON ./config/search-stats-extended.json;
      })
      (recolor.withConfig {
        config = lib.importJSON ./config/recolor.json;
      })
    ];
  };
  home.packages = [
    (pkgs.writeShellScriptBin "anki-dev" ''
      exec ${lib.getExe pkgs.anki} -b ~/code/anki-dev "$@"
    '')
  ];
  sops = {
    secrets = {
      "anki/username" = { };
      "anki/key" = { };
    };
  };
  # HACK: https://github.com/catppuccin/nix/issues/392 IFD
  catppuccin.anki.enable = false;
}
