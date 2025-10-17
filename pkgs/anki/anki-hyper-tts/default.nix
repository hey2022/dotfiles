{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "anki-hyper-tts";
  version = "1.2.2";
  src = fetchFromGitHub {
    owner = "Rytisgit";
    repo = "Anki-StylusDraw";
    rev = "v${finalAttrs.version}";
    hash = "sha256-snLYfujXXRake0QVvEUv5nm9VSFY9CUheX1AdZpISds=";
  };
  passthru.updateScript = nix-update-script { };
  meta = {
    description = "Draw and write using mouse and stylus with pressure support in Anki";
    homepage = "https://github.com/Rytisgit/Anki-StylusDraw";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
