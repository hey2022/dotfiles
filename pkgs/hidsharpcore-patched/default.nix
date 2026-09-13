{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
}:

buildDotnetModule {
  pname = "HIDSharpCore";
  version = "1.3.0-bluetooth";

  src = fetchFromGitHub {
    owner = "Tsuyumi25";
    repo = "HIDSharpCore";
    rev = "linux-hid-parent-fallback";
    hash = "sha256-pUsGYPPY1dNn+3RnifZNwATDTbp+8AqW4ctQnVIJ8oA=";
  };

  nugetDeps = [ ];
  projectFile = "HidSharp/HidSharp.csproj";

  meta = with lib; {
    description = "Patched HIDSharpCore with basic-bluetooth support";
    homepage = "https://github.com/hey2022/HIDSharpCore";
    license = licenses.asl20;
  };
}
