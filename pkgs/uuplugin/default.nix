{
  lib,
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "uuplugin";
  version = "12.2.10";

  # https://router.uu.163.com/api/plugin?type=steam-deck-plugin-x86_64
  src = fetchurl {
    url = "https://uurouter.gdl.netease.com/uuplugin/steam-deck-plugin-x86_64/v${version}/uu.tar.gz";
    sha256 = "3e82a7aaff0edaa424f7b9f4a228dd2e0844a2a2843c52fc224f7fdc2e21a246";
  };

  dontBuild = true;
  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    tar xf $src
    mkdir -p $out/bin $out/share/uuplugin
    install -m755 uuplugin $out/bin/
    install -m644 uu.conf $out/share/uuplugin/

    runHook postInstall
  '';

  meta = {
    description = "NetEase UU Plugin";
    homepage = "https://uu.163.com/console";
    license = lib.licenses.unfree;
    maintainers = with lib.maintainers; [ hey2022 ];
    mainProgram = "uuplugin";
  };
}
