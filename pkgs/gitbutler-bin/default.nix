{
  stdenv,
  lib,
  fetchurl,
  dpkg,
  autoPatchelfHook,
  libgit2,
  openssl,
  glib-networking,
  webkitgtk_4_1,
}:

stdenv.mkDerivation {
  pname = "gitbutler-bin";
  version = "0.16.10";

  src = fetchurl {
    url = "https://releases.gitbutler.com/releases/release/0.16.10-2482/linux/x86_64/GitButler_0.16.10_amd64.deb";
    hash = "sha256-5XQxDr1sgwIQc4sAMXP5grhYY8p5k8BFRZynim+Pu38=";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
  ];

  buildInputs = [
    libgit2
    openssl
    glib-networking
    webkitgtk_4_1
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r usr/* $out/

    runHook postInstall
  '';

  meta = {
    homepage = "https://gitbutler.com/downloads";
    description = "Git, finally designed for humans.";
    license = lib.licenses.fsl11Mit;
    mainProgram = "gitbutler-tauri";
  };
}
