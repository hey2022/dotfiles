{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      python3 = prev.python3.override {
        packageOverrides = python-final: python-prev: {
          pyglossary = python-prev.pyglossary.overrideAttrs (oldAttrs: {
            propagatedBuildInputs = oldAttrs.propagatedBuildInputs ++ [
              python-final.xxhash
              python-final.beautifulsoup4
            ];
          });
        };
      };
    })
  ];
  home.packages = with pkgs; [
    goldendict-ng
    pyglossary-gui
  ];
}
