{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
  buildNpmPackage,
  protobuf,
}:

let
  version = "1.17.0";
  src = fetchFromGitHub {
    owner = "Luc-Mcgrady";
    repo = "Anki-Search-Stats-Extended";
    tag = "v${version}";
    hash = "sha256-li9ZqQwzX6JCd+txLztDhQSqkXdM0Fk4xpNq1XENyKY=";
    fetchSubmodules = true;
  };

  frontend = buildNpmPackage {
    pname = "search-stats-assets";
    inherit version src;
    npmDepsHash = "sha256-uzsJUx61O4kqV58pxexJmwrx5e5AB9JQWbVEp5G4B5U=";
    nativeBuildInputs = [ protobuf ];
    buildPhase = ''
      runHook preBuild

      export PATH="$PWD/node_modules/.bin:$PATH"

      mkdir -p src/ts/proto
      protoc \
          -I anki/proto \
          --es_out src/ts/proto \
          --es_opt target=ts \
          anki/proto/anki/*.proto

      find src/ts/proto -type f -name "*.ts" -exec sed -i 's/\.js//g' {} +

      npm run format
      npm run build

      runHook postBuild
    '';

    installPhase = ''
      mkdir -p $out
      cp stats.min.js stats.min.css $out/
    '';
  };

in
anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "search-stats-extended";
  inherit version src;

  passthru.updateScript = nix-update-script { };

  preInstall = ''
    cp ${frontend}/* .
  '';

  meta = {
    description = "Search Stats Extended";
    homepage = "https://github.com/Luc-Mcgrady/Anki-Search-Stats-Extended";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
