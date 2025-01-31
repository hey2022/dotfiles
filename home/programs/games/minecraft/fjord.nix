{
  inputs,
  pkgs,
  ...
}: let
  fjordPackages = inputs.fjordlauncher.packages.${pkgs.system};
in {
  home.packages = [
    (fjordPackages.fjordlauncher.override {
      fjordlauncher-unwrapped = fjordPackages.fjordlauncher-unwrapped.overrideAttrs (oldAttrs: {
        patches = (oldAttrs.patches or []) ++ [./prism-crack.patch];
      });
    })
  ];
}
