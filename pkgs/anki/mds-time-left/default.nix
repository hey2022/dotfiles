{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "mds-time-left";
  version = "unstable-2025-06-2";
  src = fetchFromGitHub {
    owner = "cjdduarte";
    repo = "MDS_Time_Left";
    rev = "4964216a1eaf03ec299ec2a3df1379108a9f9116";
    hash = "sha256-6Mi+JdbaabW2brxK8TEs7V+QU7h6EyNCixUcUbM4BOM=";
  };
  passthru.updateScript = nix-update-script { };
  meta = {
    description = "More Decks Stats and Time Left";
    homepage = "https://github.com/cjdduarte/MDS_Time_Left";
    # Assumed to be AGPL3 https://ankiweb.net/account/terms
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
