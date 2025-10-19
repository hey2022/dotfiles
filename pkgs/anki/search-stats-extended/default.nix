{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
  buildNpmPackage,
  nodejs,
  protobuf,
}:

let
  version = "1.15.3";
  src = fetchFromGitHub {
    owner = "Luc-Mcgrady";
    repo = "Anki-Search-Stats-Extended";
    tag = "v${version}";
    hash = "sha256-rJLcE93iomIEJi267DiEkVFdHe6jE1efzTOiMlMy8iA=";
    fetchSubmodules = true;
  };

  node_modules_drv = buildNpmPackage {
    pname = "search-stats-extended-deps";
    inherit version src;
    npmDepsHash = "sha256-uzsJUx61O4kqV58pxexJmwrx5e5AB9JQWbVEp5G4B5U=";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out
      cp -r node_modules $out/
    '';
  };

in
anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "search-stats-extended";
  inherit version src;

  nativeBuildInputs = [
    nodejs
    protobuf
  ];

  buildPhase = ''
    runHook preBuild

    ln -s ${node_modules_drv}/node_modules node_modules

    export PATH=$PWD/node_modules/.bin:$PATH
    export NODE_PATH=$PWD/node_modules

    mkdir -p src/ts/proto
    protoc \
        -I anki/proto \
        --es_out src/ts/proto \
        --es_opt target=ts \
        anki/proto/anki/*.proto

    find src/ts/proto -type f -name "*.ts" -exec sed -i 's/\.js//g' {} +

    npm run build

    runHook postBuild
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Search Stats Extended";
    homepage = "https://github.com/Luc-Mcgrady/Anki-Search-Stats-Extended";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
