{
  anki-utils,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "empty-cards-shortcut";
  version = "0.1.0";
  src = ./.;
  passthru.updateScript = nix-update-script { };
})
