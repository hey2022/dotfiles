{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
}:

rustPlatform.buildRustPackage {
  pname = "cliprust";
  version = "0-unstable-2026-07-18";

  src = fetchFromGitHub {
    owner = "aulimaru";
    repo = "cliprust";
    rev = "00b4bb78f6cda36f20315440ca1e3c13a855299c";
    hash = "sha256-zfxXaHwl0hVJl05eGroHShO91jj570iZyD690E/Kfdc=";
  };

  cargoHash = "sha256-NOwB1ax2pQTDqO1FBSBpBSJeEgg7bXx43isdes1ca2U=";

  nativeBuildInputs = [
    pkg-config
  ];

  meta = {
    description = "A clipboard history manager written in rust";
    homepage = "https://github.com/aulimaru/cliprust";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ hey2022 ];
    mainProgram = "cliprust";
  };
}
