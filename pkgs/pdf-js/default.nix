{
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage rec {
  pname = "pdf-js";
  version = "6.3.289";
  src = fetchFromGitHub {
    owner = "mozilla";
    repo = "pdf.js";
    tag = "v${version}";
    hash = "sha256-qYBROGejO4pmfR9Bq0jVXEK0XXlOw6jsncWVqL/KMtc=";
  };
  npmDepsHash = "sha256-hb10H+MR4dAeM7i0A5Fuca8kska1v5i8JNYgjgbZuDQ=";

  buildPhase = ''
    runHook preBuild

    npx gulp generic

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r build/generic/* $out

    rm $out/web/compressed.tracemonkey-pldi-09.pdf
    sed -i 's/compressed.tracemonkey-pldi-09.pdf//' $out/web/viewer.mjs

    runHook postInstall
  '';
}
