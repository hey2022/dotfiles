{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
}:

rustPlatform.buildRustPackage rec {
  pname = "cliprust";
  version = "0-unstable-2025-07-22";

  src = fetchFromGitHub {
    owner = "aulimaru";
    repo = "cliprust";
    rev = "950f62613647a1543b45dd0e7ce0d7e881f76e64";
    hash = "sha256-/4oZLllhANl1HjjI6WmrBW1fsZk+LVgV27NDZskbVIY=";
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
