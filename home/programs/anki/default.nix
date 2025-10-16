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
        anki-popup-dictionary
        anki-fsrs-helper
        mds-time-left
      ];
  };
  sops = {
    secrets = {
      "anki/username" = { };
      "anki/key" = { };
    };
  };
}
