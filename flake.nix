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
      inputs.home-manager.follows = "home-manager";
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
      nur,
      home-manager,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./flake-modules/treefmt.nix
      ];
      systems = [ "x86_64-linux" ];
      flake = {
        nixosConfigurations = {
          desktop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [ ./hosts/desktop/configuration.nix ];
          };
          goon = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/goon/configuration.nix
              disko.nixosModules.default
            ];
          };
        };
        homeConfigurations = {
          "yiheng@desktop" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = [
              ./hosts/desktop/home.nix
              nur.modules.homeManager.default
              inputs.nix-index-database.hmModules.nix-index
            ];

            extraSpecialArgs = {
              inherit inputs;
            };
          };
          "yiheng@goon" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = [
              ./hosts/goon/home.nix
              nur.modules.homeManager.default
              inputs.nix-index-database.hmModules.nix-index
            ];

            extraSpecialArgs = {
              inherit inputs;
            };
          };
        };
      };
    };
}
