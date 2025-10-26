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
        (popup-dictionary.withConfig {
          config = lib.importJSON ./popup-dictionary.json;
        })
        (fsrs-helper.withConfig {
          config = lib.importJSON ./fsrs-helper.json;
        })
        mds-time-left
        ajt-card-management
        # anki-contanki
        anki-hyper-tts
        anking-notes-addon
        anki-stylusdraw
        # (life-drain.withConfig {
        #   config = lib.importJSON ./life-drain.json;
        # })
        # (search-stats-extended.withConfig {
        #   config = lib.importJSON ./search-stats-extended.json;
        # })
      ];
  };
  sops = {
    secrets = {
      "anki/username" = { };
      "anki/key" = { };
    };
  };
}
