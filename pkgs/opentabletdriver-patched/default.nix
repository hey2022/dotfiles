{
  opentabletdriver,
  fetchpatch2,
  hidsharpcore,
}:

let
  bluetooth-patch = fetchpatch2 {
    url = "https://patch-diff.githubusercontent.com/raw/OpenTabletDriver/OpenTabletDriver/pull/4672.diff";
    hash = "sha256-f+3OxIqVz7GDYW6Wge3pZvkBSnEIDcJAIwPrP1f3MqE=";
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
