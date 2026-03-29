{
  appimageTools,
  fetchurl,
}:

let
  prerelease-version = "2.8.0";
  build = "282464";
  date = "2026-03-15";

  pname = "keepassxc-snapshot";
  version = "${prerelease-version}-unstable-${date}";
  src = fetchurl {
    url = "https://snapshot.keepassxc.org/build-${build}/KeePassXC-${prerelease-version}-snapshot-x86_64.AppImage";
    hash = "sha256-z/CxwLOYGbSpuSxiEDWeQuyPwI5ldSPe8SzG7kEz/Mc=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    cp -r ${appimageContents}/usr/share $out/
    substituteInPlace $out/share/applications/org.keepassxc.KeePassXC.desktop \
      --replace-fail 'Exec=keepassxc' "Exec=$out/bin/${pname}"
  '';
}
