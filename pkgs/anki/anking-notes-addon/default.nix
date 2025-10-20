{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "anking-notes-addon";
  version = "3.4.4";
  src = fetchFromGitHub {
    owner = "AnKing-VIP";
    repo = "anking_notes_addon";
    tag = finalAttrs.version;
    hash = "sha256-lP720qeryTOJafGGAVzaLgOFkWKyprRjAVxomIbFrXM=";
  };
  sourceRoot = "${finalAttrs.src.name}/src/anking_notetypes";
  passthru.updateScript = nix-update-script { };
  meta = {
    description = "AnKing notes addon";
    homepage = "https://github.com/AnKing-VIP/anking_notes_addon";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
