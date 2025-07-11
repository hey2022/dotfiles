{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
}:

rustPlatform.buildRustPackage rec {
  pname = "cliprust";
  version = "unstable-2025-07-11";

  src = fetchFromGitHub {
    owner = "aulimaru";
    repo = "cliprust";
    rev = "b14a6a9aef00c567ff36bf88f706d9b25bd13e3d";
    hash = "sha256-Wilh/c89imuLFWNI94icS2pcRGCBaPkNz2HdDxd+gCk=";
  };

  cargoHash = "sha256-dKJyrKlgrH3iidD+btv5t7wPpHOtw4BnYN+uGSKKxJM=";

  nativeBuildInputs = [
    pkg-config
  ];

  meta = {
    description = "A clipboard history manager written in rust";
    homepage = "https://github.com/aulimaru/cliprust";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "cliprust";
  };
}
