{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  fetchurl,
  fetchPnpmDeps,
  pnpm_10,
  pnpmConfigHook,
  nodejs,
  makeDesktopItem,
  pkg-config,
  wrapGAppsHook3,
  atk,
  cairo,
  dbus,
  gdk-pixbuf,
  glib,
  glib-networking,
  gsettings-desktop-schemas,
  gtk3,
  libayatana-appindicator,
  libsoup_3,
  librsvg,
  libxkbcommon,
  mpv-unwrapped,
  openssl,
  pango,
  sqlite,
  webkitgtk_4_1,
  wayland,
  nix-update-script,
}:

let
  # Keep this in sync with the v8 crate version in Cargo.lock.
  v8Version = "130.0.7";

  # Only targets with a prebuilt archive. meta.platforms is derived from this.
  v8Downloads = {
    x86_64-linux = {
      target = "x86_64-unknown-linux-gnu";
      hash = "sha256-pkdsuU6bAkcIHEZUJOt5PXdzK424CEgTLXjLtQ80t10=";
    };
    aarch64-linux = {
      target = "aarch64-unknown-linux-gnu";
      hash = "sha256-vu/ns1q+53FZ98tVCWZmsHYwwRBH1fOnTdBlhjcpkVo=";
    };
  };

  v8Target = v8Downloads.${stdenv.hostPlatform.system};

  v8Archive = fetchurl {
    inherit (v8Target) hash;
    url = "https://github.com/denoland/rusty_v8/releases/download/v${v8Version}/librusty_v8_release_${v8Target.target}.a.gz";
  };

  # lindera-ipadic's MeCab dictionary, fetched for its build script.
  ipadic = fetchurl {
    url = "https://github.com/lindera-morphology/mecab-ipadic/archive/refs/tags/2.7.0-20070801.tar.gz";
    hash = "sha256-CZ5G6A1V58DWkGeDr/cTdI4a6Q9Gxe+W7BU7vwm/VVA=";
  };

  desktopItem = makeDesktopItem {
    name = "limusic";
    desktopName = "Limusic";
    genericName = "Music Player";
    comment = "Native YouTube Music client";
    exec = "limusic";
    icon = "limusic";
    categories = [
      "AudioVideo"
      "Audio"
      "Player"
    ];
    startupWMClass = "Limusic";
  };
in
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "limusic";
  version = "1.4.1";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "SimoHypers";
    repo = "limusic";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JgDz/MR+C1yPsBLcrDYnr+1Ds5ud6WhWR/HAsKBVhsY=";
  };

  cargoHash = "sha256-RqUC+NULMlpC64Eu1kA7zewxcKVvBBlbHut8baNibI8=";

  # Build only limusic-app, not every workspace member.
  buildAndTestSubdir = "src-tauri";

  # The custom-protocol feature enables production asset embedding. Without it Tauri loads devUrl.
  cargoBuildFlags = [ "--features=tauri/custom-protocol" ];

  # The UI and its lockfile live in ui/, so both hooks need that path.
  pnpmDeps = fetchPnpmDeps {
    pname = "${finalAttrs.pname}-ui";
    version = finalAttrs.version;
    src = "${finalAttrs.src}/ui";
    pnpm = pnpm_10;
    fetcherVersion = 5;
    hash = "sha256-0CYqjEWQwwAwHbqCWlAuwP/g+gEOFwzEsXUp29oP9uE=";
  };
  pnpmRoot = "ui";

  nativeBuildInputs = [
    nodejs
    pkg-config
    pnpm_10
    pnpmConfigHook
    wrapGAppsHook3
  ];

  buildInputs = [
    atk
    cairo
    dbus
    gdk-pixbuf
    glib
    glib-networking
    gsettings-desktop-schemas
    gtk3
    libayatana-appindicator
    libsoup_3
    librsvg
    libxkbcommon
    # libmpv2-sys needs libmpv only. Its bindings are pregenerated and need no headers.
    mpv-unwrapped
    openssl
    pango
    # nixpkgs sets LIBSQLITE3_SYS_USE_PKG_CONFIG, so rusqlite links system sqlite.
    sqlite
    webkitgtk_4_1
    wayland
  ];

  env = {
    RUSTY_V8_ARCHIVE = v8Archive;
    LINDERA_IPADIC_ARCHIVE = ipadic;
  };

  # lindera-ipadic's build script hardcodes a GitHub download. Replace it with the store path.
  postPatch = ''
    while IFS= read -r -d "" buildRs; do
      substituteInPlace "$buildRs" \
        --replace-fail \
          'let resp = ureq::get(download_url).call()?;' \
          'let mut resp = std::fs::File::open(std::env::var("LINDERA_IPADIC_ARCHIVE")?)?;' \
        --replace-fail \
          'io::copy(&mut resp.into_reader(), &mut dest)?;' \
          'io::copy(&mut resp, &mut dest)?;'
    done < <(find "$NIX_BUILD_TOP" -type f -path '*/lindera-ipadic-0.30.0/build.rs' -print0)
  '';

  # tauri-build embeds ui/build at compile time, so build the frontend first.
  preBuild = ''
    pushd ui
    pnpm build
    popd
  '';

  # Cargo names the binary limusic-app. The product name is limusic.
  postInstall = ''
    mv "$out/bin/limusic-app" "$out/bin/limusic"

    install -Dm644 ${desktopItem}/share/applications/limusic.desktop \
      "$out/share/applications/limusic.desktop"
    install -Dm644 src-tauri/icons/32x32.png \
      "$out/share/icons/hicolor/32x32/apps/limusic.png"
    install -Dm644 src-tauri/icons/64x64.png \
      "$out/share/icons/hicolor/64x64/apps/limusic.png"
    install -Dm644 src-tauri/icons/128x128.png \
      "$out/share/icons/hicolor/128x128/apps/limusic.png"
    install -Dm644 src-tauri/icons/128x128@2x.png \
      "$out/share/icons/hicolor/256x256/apps/limusic.png"
    install -Dm644 src-tauri/icons/icon.png \
      "$out/share/icons/hicolor/512x512/apps/limusic.png"
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Feature rich, native desktop, YouTube Music client";
    homepage = "https://github.com/SimoHypers/limusic";
    changelog = "https://github.com/SimoHypers/limusic/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ hey2022 ];
    mainProgram = "limusic";
    platforms = builtins.attrNames v8Downloads;
  };
})
