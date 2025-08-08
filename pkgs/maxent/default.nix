{
  lib,
  stdenv,
  fetchFromGitHub,
  jdk8,
  zip,
  stripJavaArchivesHook,
  makeWrapper,
}:

stdenv.mkDerivation rec {
  pname = "maxent";
  version = "3.4.4";

  src = fetchFromGitHub {
    owner = "mrmaxent";
    repo = "Maxent";
    rev = "v${version}";
    hash = "sha256-4Hr2465sxn8WP2oMvoDuxj6hHotpI47qPoea4ymEB4s=";
  };

  nativeBuildInputs = [
    jdk8
    zip
    makeWrapper
    stripJavaArchivesHook
  ];

  patches = [
    ./float-to-double.patch
  ];

  buildPhase = ''
    runHook preBuild

    make compile
    jar cvfm maxent.jar density/mc.mf density/*.class density/*.html gnu/getopt/* gui/layouts/*.class com/macfaq/io/LittleEndian*.class density/tools/*.class ptolemy/plot/*.class density/parameters.csv

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 maxent.jar $out/share/java/maxent.jar

    # Create a wrapper script
    makeWrapper ${jdk8}/bin/java $out/bin/maxent \
      --add-flags "-jar $out/share/java/maxent.jar"

    runHook postInstall
  '';

  meta = {
    description = "Maximum entropy modelling of species geographic distributions";
    homepage = "https://github.com/mrmaxent/Maxent";
    license = with lib.licenses; [
      lgpl2Only
      mit
    ];
    maintainers = with lib.maintainers; [ hey2022 ];
    mainProgram = "maxent";
    platforms = lib.platforms.all;
  };
}
