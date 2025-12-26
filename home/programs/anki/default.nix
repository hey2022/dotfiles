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
    sync = {
      usernameFile = config.sops.secrets."anki/username".path;
      keyFile = config.sops.secrets."anki/key".path;
      autoSync = true;
    };
    addons =
      with pkgs;
      with pkgs.ankiAddons;
      [
        anki-connect
        anki-quizlet-importer-extended
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
        # anki-contanki
        anking-notes-addon
        anki-stylusdraw
        # (search-stats-extended.withConfig {
        #   config = lib.importJSON ./config/search-stats-extended.json;
        # })
        (remaining-time.withConfig {
          config = lib.importJSON ./config/remaining-time.json;
        })
      ];
  };
  sops = {
    secrets = {
      "anki/username" = { };
      "anki/key" = { };
    };
  };
}
