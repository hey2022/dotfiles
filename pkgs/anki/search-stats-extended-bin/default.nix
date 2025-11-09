{
  lib,
  anki-utils,
  fetchurl,
  nix-update-script,
  unzip,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "search-stats-extended-bin";
  version = "1.17.0";
  src = fetchurl {
    url = "https://github.com/Luc-Mcgrady/Anki-Search-Stats-Extended/releases/download/v${finalAttrs.version}/searchStatsExtended.ankiaddon";
    hash = "sha256-OdHHT+3FUzMlLvS9BY6B8yYctvRm6N5/3gb4NY/0lpY=";
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
