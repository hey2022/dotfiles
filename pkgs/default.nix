{ self, inputs, ... }:

{
  perSystem =
    {
      self',
      pkgs,
      system,
      ...
    }:
    let
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        config = import "${self}/common/nixpkgs.nix";
      };
    in
    {
      packages = rec {
        default = self'.packages.nvim;
        ap-dl = pkgs.callPackage ./ap-dl { };
        apcap = pkgs.callPackage ./apcap { };
        cliprust = pkgs.callPackage ./cliprust { };
        neovim-anywhere = pkgs.callPackage ./neovim-anywhere {
          neovim = self'.packages.nvim;
        };
        ticktick-cracked = pkgs.callPackage ./ticktick-cracked { };
        keepassxc-snapshot = pkgs.callPackage ./keepassxc-snapshot { };
        uuplugin = pkgs.callPackage ./uuplugin { };
        reshade-steam-proton = pkgs.callPackage ./reshade-steam-proton { };
        hidsharpcore-patched = pkgs.callPackage ./hidsharpcore-patched { };
        opentabletdriver-patched = pkgs.callPackage ./opentabletdriver-patched {
          hidsharpcore = hidsharpcore-patched;
        };
        pdf-js = pkgs.callPackage ./pdf-js { };
        pdf-open = pkgs.callPackage ./pdf-open { };
      }
      // (import ./anki { inherit (pkgs) callPackage; })
      // (import ./firefox-addons { inherit pkgs; })
      // (import ./iosevka { pkgs = pkgs-stable; });
    };
}
