{
  stdenvNoCC,
  lib,
  fetchurl,
  makeWrapper,
  curl,
  file,
  git,
  gnugrep,
  p7zip,
  wine,
}:

let
  binPath = [
    curl
    file
    git
    gnugrep
    p7zip
    wine
  ];
in
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "reshade-steam-proton";
  version = "0-unstable-2023-04-03";
  src = fetchurl {
    url = "https://raw.githubusercontent.com/kevinlekiller/reshade-steam-proton/refs/heads/main/reshade-linux.sh";
    sha256 = "089rw5sw30xlz6426nrv2d2zhdvcw017hcnhvxjkk5igc1fpvp0r";
  };

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 $src $out/bin/reshade-steam-proton

    wrapProgram $out/bin/reshade-steam-proton \
      --prefix PATH : ${lib.makeBinPath binPath}

    runHook postInstall
  '';

  meta = {
    homepage = "https://github.com/kevinlekiller/reshade-steam-proton";
    description = "Bash script to download ReShade and the shaders and link them to games running with wine or proton on Linux";
    license = lib.licenses.gpl2Only;
    maintainers = with lib.maintainers; [ hey2022 ];
    platforms = lib.platforms.linux;
    mainProgram = "reshade-steam-proton";
  };
})
