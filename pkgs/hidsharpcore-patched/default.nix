{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
}:

buildDotnetModule {
  pname = "HIDSharpCore";
  version = "1.3.0-basic-bluetooth";

  src = fetchFromGitHub {
    owner = "hey2022";
    repo = "HIDSharpCore";
    rev = "2db7daee74653947c9c24fc841cf96c405ae1b1f";
    hash = "sha256-W+ElXGqgoTaBvvScwg+nKNB/zrr9hOtGMd5gp9KBui4=";
  };

  nugetDeps = ./deps.json;
  projectFile = "HidSharp/HidSharp.csproj";

  meta = with lib; {
    description = "Patched HIDSharpCore with basic-bluetooth support";
    homepage = "https://github.com/hey2022/HIDSharpCore";
    license = licenses.asl20;
  };
}
