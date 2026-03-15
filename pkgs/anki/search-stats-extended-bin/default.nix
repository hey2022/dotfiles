{
  lib,
  anki-utils,
  fetchurl,
  nix-update-script,
  unzip,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "search-stats-extended-bin";
  version = "1.21.0";
  src = fetchurl {
    url = "https://github.com/Luc-Mcgrady/Anki-Search-Stats-Extended/releases/download/v${finalAttrs.version}/searchStatsExtended.ankiaddon";
    hash = "sha256-ZRtYomX5NNOZkLXIq0iAQM2g//2liy0G1RGIlgxfg6k=";
  };
  nativeBuildInputs = [
    unzip
  ];
  unpackPhase = ''
    runHook preUnpack

    unzip $src

    runHook postUnpack
  '';
  passthru.updateScript = nix-update-script { };
  meta = {
    description = "Search Stats Extended";
    homepage = "https://github.com/Luc-Mcgrady/Anki-Search-Stats-Extended";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
