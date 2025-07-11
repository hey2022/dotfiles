{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    flake-parts.url = "github:hercules-ci/flake-parts";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tls-xb = {
      url = "github:hey2022/tls-xb";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fjordlauncher = {
      url = "github:unmojang/FjordLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    zen-nebula = {
      url = "github:JustAdumbPrsn/Zen-Nebula";
      flake = false;
    };
    firefox-ui-fix = {
      url = "github:black7375/Firefox-UI-Fix";
      flake = false;
    };
    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };
    reshade-shaders = {
      url = "github:crosire/reshade-shaders";
      flake = false;
    };
  };

  outputs =
    {
      flake-parts,
      nixpkgs,
      disko,
      home-manager,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./flake-modules/pkgs.nix
        ./flake-modules/treefmt.nix
      ];
      systems = [
        "x86_64-linux"
      ];
      perSystem =
        { pkgs, ... }:
        {
          packages.nixpkgs-patched = pkgs.applyPatches {
            name = "nixpkgs-patched";
            src = nixpkgs;
            patches = [ ];
          };
          packages.home-manager-patched = pkgs.applyPatches {
            name = "home-manager-patched";
            src = home-manager;
            patches = [ ];
          };
        };

      flake =
        { config, ... }:
        let
          mkNixpkgs =
            system:
            import (config.packages.${system}.nixpkgs-patched) {
              inherit system;
              config = import ./common/nixpkgs.nix;
              overlays = [
                (final: prev: builtins.mapAttrs (_: package: package) config.packages.${system})
              ];
            };

          mkNixosSystem =
            system: modules:
            nixpkgs.lib.nixosSystem {
              inherit system;
              pkgs = mkNixpkgs system;
              specialArgs = { inherit inputs; };
              modules = modules;
            };

          mkHomeConfig =
            system: modules:
            let
              home-manager' = import (config.packages.${system}.home-manager-patched) { };
            in
            home-manager'.lib.homeManagerConfiguration {
              pkgs = mkNixpkgs system;
              modules = modules;
              extraSpecialArgs = { inherit inputs; };
            };
        in
        {
          nixosConfigurations = {
            desktop = mkNixosSystem "x86_64-linux" [
              ./hosts/desktop/configuration.nix
            ];

            goon = mkNixosSystem "x86_64-linux" [
              ./hosts/goon/configuration.nix
              disko.nixosModules.default
            ];
          };

          homeConfigurations = {
            "yiheng@desktop" = mkHomeConfig "x86_64-linux" [
              ./hosts/desktop/home.nix
            ];

            "yiheng@goon" = mkHomeConfig "x86_64-linux" [
              ./hosts/goon/home.nix
            ];
          };
        };
    };
}
