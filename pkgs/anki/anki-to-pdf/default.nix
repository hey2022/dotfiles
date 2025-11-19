{
  lib,
  anki-utils,
  fetchFromGitHub,
  nix-update-script,
}:

anki-utils.buildAnkiAddon (finalAttrs: {
  pname = "anki-to-pdf";
  version = "1.8.1";
  src = fetchFromGitHub {
    owner = "AnKing-VIP";
    repo = "anki_to_pdf";
    tag = finalAttrs.version;
    hash = "sha256-Mopc9vTscJP4pXNgI+9b9DwawtIWGllO3m80OAPAPk8=";
  };
  sourceRoot = "${finalAttrs.src.name}/src/pdf_exporter";
  passthru.updateScript = nix-update-script { };
  postInstall = ''
    cd $out/$installPrefix
    cp default.css user_files/user.css
    cp -r anking_export_templates/* user_files/

    for dir in user_files/*; do
      if [ -d "$dir" ]; then
          touch "$dir/styling.css"
      fi
    done
  '';
  meta = {
    description = "Export Anki to PDF";
    homepage = "https://github.com/AnKing-VIP/anki_to_pdf";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
})
