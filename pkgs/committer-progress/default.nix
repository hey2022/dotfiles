{
  stdenvNoCC,
  lib,
  fetchurl,
  makeWrapper,
  gh,
}:

let
  runtimeInputs = [
    gh
  ];
in
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "committer-progress.sh";
  version = "0-unstable-2026-08-16";
  src = fetchurl {
    url = "https://gist.githubusercontent.com/pbsds/7af827a53c103cd3d40902f9b0b21843/raw/e43f68c0a307119f97bc0f56cff75cdad8b70aff/committer-progress.sh";
    sha256 = "sha256-RjXYdSwLMQUqid1/TKnQfpK6oVNcbTr8pIOSeEiYMYI=";
  };

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 $src $out/bin/committer-progress.sh

    wrapProgram $out/bin/committer-progress.sh \
      --prefix PATH : ${lib.makeBinPath runtimeInputs}

    runHook postInstall
  '';

  meta = {
    homepage = "https://gist.github.com/pbsds/7af827a53c103cd3d40902f9b0b21843";
    description = "Nixpkgs Committer Progress";
    license = lib.licenses.mit;
    mainProgram = "committer-progress.sh";
  };
})
