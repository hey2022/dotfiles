{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
  buildNpmPackage,
  nodejs_22,
}:

let
  version = "25.7.3i33";
  src = fetchFromGitHub {
    owner = "trgkanki";
    repo = "remaining_time";
    tag = "v${version}";
    hash = "sha256-bmtpuQakmMg/VnV+5NxUFoiXMkaDw9NZyWDV+ycvGa0=";
  };

  # HACK: https://github.com/npm/cli/issues/8805 upstream needs to update package-lock.json
  frontend = buildNpmPackage.override { nodejs = nodejs_22; } {
    pname = "remaining-time-assets";
    inherit version src;

    npmDepsHash = "sha256-IM9mvG09LbIjMq+wcIlfpT//KBGgWnDaWI3832Ct1f8=";
    npmFlags = [ "--ignore-scripts" ];

    buildPhase = ''
      runHook preBuild
      npm run compile
      runHook postBuild
    '';

    installPhase = ''
      cp src/js/main.min.js $out
    '';
  };

  pname = "remaining-time";
in
anki-utils.buildAnkiAddon (finalAttrs: {
  inherit version src pname;

  sourceRoot = "${finalAttrs.src.name}/src";

  patches = [ ./remove-changelog.patch ];
  patchFlags = [
    "-p1"
    "-d"
    ".."
  ];
  postPatch = ''
    substituteInPlace utils/configrw.py \
      --replace-fail 'addons21Index = fPathParts.index("addons21")' 'pass' \
      --replace-fail '_cache.append(fPathParts[addons21Index + 1])' '_cache.append("${pname}")'
  '';

  preInstall = ''
    mkdir js
    cp ${frontend} js/main.min.js
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Shows you how much time it takes to complete a deck";
    homepage = "https://github.com/trgkanki/remaining_time";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
