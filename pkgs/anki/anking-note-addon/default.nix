{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "anking-notes-addon";
  version = "3.4.2";
  src = fetchFromGitHub {
    owner = "AnKing-VIP";
    repo = "anking_notes_addon";
    rev = finalAttrs.version;
    hash = "sha256-CH25Ag/FK7MsnPGfuLWXtuNmbVqI4FRoxdRwqjDNiGs=";
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
