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
  version = "0.17.6";

  src = fetchurl {
    url = "https://releases.gitbutler.com/releases/release/${finalAttrs.version}-2578/linux/x86_64/GitButler_${finalAttrs.version}_amd64.deb";
    hash = "sha256-pSUGdnmLi6K6EDPCE1PhmVHEZSpbj/U7OpsEILJx4GM=";
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
