{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "life-drain";
  version = "2.8.3";
  src = fetchFromGitHub {
    owner = "Yutsuten";
    repo = "anki-lifedrain";
    rev = "v${finalAttrs.version}";
    hash = "sha256-5MFIM7RBydG1GOSkCljHLOii5BMG3Ws5vWgREYxIi4M=";
  };
  passthru.updateScript = nix-update-script { };
  sourceRoot = "${finalAttrs.src.name}/src";
  meta = {
    description = "Anki add-on that adds a life bar to anki while reviewing.";
    homepage = "https://github.com/Yutsuten/anki-lifedrain";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
