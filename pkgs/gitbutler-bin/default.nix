{
  stdenv,
  lib,
  fetchurl,
  dpkg,
  autoPatchelfHook,
  glib-networking,
  webkitgtk_4_1,
  makeWrapper,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gitbutler-bin";
  version = "0.16.10";

  src = fetchurl {
    url = "https://releases.gitbutler.com/releases/release/${finalAttrs.version}-2482/linux/x86_64/GitButler_0.16.10_amd64.deb";
    hash = "sha256-5XQxDr1sgwIQc4sAMXP5grhYY8p5k8BFRZynim+Pu38=";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    webkitgtk_4_1
    glib-networking
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r usr/* $out/

    wrapProgram "$out/bin/${finalAttrs.meta.mainProgram}" \
      --prefix GIO_EXTRA_MODULES : "${glib-networking}/lib/gio/modules"

    runHook postInstall
  '';

  meta = {
    homepage = "https://gitbutler.com/downloads";
    description = "Git, finally designed for humans.";
    license = lib.licenses.fsl11Mit;
    mainProgram = "gitbutler-tauri";
  };
})
