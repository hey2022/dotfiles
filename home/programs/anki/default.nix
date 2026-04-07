{
  config,
  lib,
  pkgs,
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
    addons =
      with pkgs;
      with pkgs.ankiAddons;
      [
        anki-connect
        (anki-contanki.withConfig {
          config = lib.importJSON ./config/contanki.json;
          userFiles = ./user-files/anki-contanki;
        })
        (anki-to-pdf.withConfig {
          userFiles = ./user-files/anki-to-pdf;
        })
        review-heatmap
        (popup-dictionary.withConfig {
          config = lib.importJSON ./config/popup-dictionary.json;
        })
        (fsrs4anki-helper.withConfig {
          config = lib.importJSON ./config/fsrs-helper.json;
        })
        mds-time-left
        (ajt-card-management.withConfig {
          config = lib.importJSON ./config/ajt-card-management.json;
        })
        anking-notes-addon
        anki-stylusdraw
        (search-stats-extended-bin.withConfig {
          config = lib.importJSON ./config/search-stats-extended.json;
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
}
