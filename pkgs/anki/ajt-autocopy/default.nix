{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "ajt-autocopy";
  version = "26.10.20.0";
  src =
    (fetchFromGitHub {
      owner = "Ajatt-Tools";
      repo = "autocopy";
      tag = "v${finalAttrs.version}";
      hash = "sha256-hBM2nqe2Mj3PV/0YVwznaEWvZDBB0fzAJjeriY9j3UM=";
      fetchSubmodules = true;
    }).overrideAttrs
      (oldAttrs: {
        env = oldAttrs.env or { } // {
          GIT_CONFIG_COUNT = 1;
          GIT_CONFIG_KEY_0 = "url.https://github.com/.insteadOf";
          GIT_CONFIG_VALUE_0 = "git@github.com:";
        };
      });
  sourceRoot = "${finalAttrs.src.name}/autocopy";
  passthru.updateScript = nix-update-script { };
  meta = {
    description = "Automatically copy text from a card to the clipboard";
    homepage = "https://github.com/Ajatt-Tools/autocopy";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ hey2022 ];
  };
})
