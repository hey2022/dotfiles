{ pkgs, ... }:
{
  home.packages = [
    (pkgs.prismlauncher.override {
      prismlauncher-unwrapped = pkgs.prismlauncher-unwrapped.overrideAttrs (oldAttrs: {
        patches = (oldAttrs.patches or [ ]) ++ [ ./prism-crack.patch ];
      });
    })
  ];
}
