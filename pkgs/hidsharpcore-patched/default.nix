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
    hash = "sha256-z9v7oHQa/EKV91Qv0HiuXfv/EefS0+/JEbxsodTQfus=";
  };

  nugetDeps = ./deps.json;
  projectFile = "HidSharp/HidSharp.csproj";

  meta = with lib; {
    description = "Patched HIDSharpCore with basic-bluetooth support";
    homepage = "https://github.com/hey2022/HIDSharpCore";
    license = licenses.asl20;
  };
}
