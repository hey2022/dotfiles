{
  stdenvNoCC,
  jq,
}:

stdenvNoCC.mkDerivation {
  pname = "apcap";
  version = "0.1.0";
  src = ./.;

  buildInputs = [ jq ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp apcap.jq $out/bin/apcap
    runHook postInstall
  '';

  postFixup = ''
    patchShebangs $out/bin/apcap
  '';
}
