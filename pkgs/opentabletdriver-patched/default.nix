{
  opentabletdriver,
  fetchpatch2,
  hidsharpcore,
}:

let
  bluetooth-patch = fetchpatch2 {
    url = "https://github.com/Tsuyumi25/OpenTabletDriver/compare/0.6.x...hey2022:OpenTabletDriver:bluetooth-ctl6100wl.diff";
    hash = "sha256-uuxzon7Ad+CzsYSgy/W7zKHrD3XKu+9EYFryoT/Vpv4=";
  };
in
opentabletdriver.overrideAttrs (oldAttrs: {
  patches = (oldAttrs.patches or [ ]) ++ [
    bluetooth-patch
  ];
  postInstall = (oldAttrs.postInstall or "") + ''
    PATCHED_DLL=$(find ${hidsharpcore} -name "HidSharpCore.dll" | head -n 1)
    find $out -name "HidSharpCore.dll" -exec cp -f "$PATCHED_DLL" {} \;
  '';
})
