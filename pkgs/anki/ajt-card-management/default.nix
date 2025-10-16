{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "ajt-card-management";
  version = "25.10.14.0";
  src = fetchFromGitHub {
    owner = "Ajatt-Tools";
    repo = "learn-now-button";
    rev = "v${finalAttrs.version}";
    hash = "sha256-ebGMrEfDV9ZWtrV2AjiaNd7WMeNBHlaOBE2xL1x0nWs=";
    fetchSubmodules = true;
  };
  sourceRoot = "${finalAttrs.src.name}/card_management";
  passthru.updateScript = nix-update-script { };
  meta = {
    description = "Put cards in the learning queue and answer cards from the Card Browser";
    homepage = "https://github.com/Ajatt-Tools/learn-now-button";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
