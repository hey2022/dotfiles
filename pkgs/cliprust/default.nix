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
    rev = "25c46cedeecef32dec94fa2ffb57b30cddce1e05";
    hash = "sha256-Ognk4bckhIakkO75NfifYjq4b+AYk1cEkKHZGraIFrU=";
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
