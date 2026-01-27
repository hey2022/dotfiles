{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "anki-stylusdraw";
  version = "1.7";
  src = fetchFromGitHub {
    owner = "Rytisgit";
    repo = "Anki-StylusDraw";
    rev = "v${finalAttrs.version}";
    hash = "sha256-SINHUSVDfUPX5pCZ2qMLiUjUG7CbHLawmlvSY2LPenk=";
    fetchSubmodules = true;
  };
  sourceRoot = "${finalAttrs.src.name}/AnkiDraw";
  passthru.updateScript = nix-update-script { };
  meta = {
    description = "Draw and write using mouse and stylus with pressure support in Anki";
    homepage = "https://github.com/Rytisgit/Anki-StylusDraw";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
