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
        review-heatmap
        (recolor.withConfig {
          config = lib.importJSON ./recolor.json;
        })
        popup-dictionary
        (fsrs-helper.withConfig {
          config = lib.importJSON ./fsrs-helper.json;
        })
        mds-time-left
        ajt-card-management
        # anki-contanki
        anki-hyper-tts
        anking-note-addon
        anki-stylusdraw
        life-drain
        # search-stats-extended
      ];
  };
  sops = {
    secrets = {
      "anki/username" = { };
      "anki/key" = { };
    };
  };
}
