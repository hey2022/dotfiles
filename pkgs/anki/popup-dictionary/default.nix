{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "popup-dictionary";
  version = "1.0.0-beta.1";
  src = fetchFromGitHub {
    owner = "glutanimate";
    repo = "popup-dictionary";
    rev = "v${finalAttrs.version}";
    hash = "sha256-b5VxHJ5GPNl9pXwQhC/RiZu5+vyqf1addy1QkCI1Uiw=";
  };
  patches = [ ./qt6.patch ];
  patchFlags = [
    "-p1"
    "-d"
    "../.."
  ];
  sourceRoot = "${finalAttrs.src.name}/src/popup_dictionary";
  passthru.updateScript = nix-update-script { };
  meta = {
    description = "Pop-up Dictionary Add-on for Anki";
    homepage = "https://github.com/glutanimate/popup-dictionary";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
