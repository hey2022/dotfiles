<h1 align="center">hey2022/dotfiles</h1>

Cooked configs for NixOS and Home-Manager using [flake-parts](https://github.com/hercules-ci/flake-parts).

See an overview of the flake outputs by running
`nix flake show github:hey2022/dotfiles`.

Project documentation can be found [here](./docs/).

## 🗃️ Architecture

The architecture of this flake is designed around the concepts of [roles, profiles, and components](https://help.puppet.com/core/current/Content/PuppetCore/configuring_roles_and_profiles.htm). It isolates implementation code from decision-making logic, allowing configurations to remain modular and clean.

- Roles: The entry point for each machine is found in [hosts](./hosts), where it is split into system NixOS `configuration.nix` and user Home-Manager `home.nix` roles. They act as the top-level configuration that enables profiles for the purpose of its role as well as setting machine specific configuration.

- Profiles: Configurable options are where profiles come into play. You can find them in [.system/profiles](./system/profiles/) and [./home/profiles](./home/profiles/). While most shared configurations across all machines are enabled by default, profiles act as a control layer defining high-level group options to enable extra sets of programs and services on or off.

- Components: The module system is equivalent to components. NixOS configurations live in [./system](./system) and Home Manager configurations live in [./home](./home). They define localized program configurations while remaining agnostic of which roles and profiles it is used in. To achieve this and the principle of [Locality of Behaviour (LoB)](https://htmx.org/essays/locality-of-behaviour/) in profiles, each component should not look up into profiles for their `lib.mkIf config.profile.<...>.enable` options, but rather it should enable based on its own `lib.mkIf cfg.enable` option that will be set by profiles. Upstream NixOS or Home Manager modules already provide these `enable` options, so upstream options should be used where possible, if not an `enable` option should be created for the program.

[![](https://help.puppet.com/core/current/Content/PuppetCore/roles_and_profiles_overview_server.png)](https://help.puppet.com/core/current/Content/PuppetCore/configuring_roles_and_profiles.htm)

### Additional Directories:

- [lib](./lib): Helper functions
- [modules](./modules): Modules intended to be upstreamed into [nixpkgs](https://github.com/NixOS/nixpkgs/) or [home-manager](https://github.com/nix-community/home-manager)
- [flake-modules](./flake-modules): Flake-parts modules
- [pkgs](./pkgs): Custom package definitions

## 💾 Resources

Other configurations where I have stolen from.

- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)
- [Mic92/dotfiles](https://github.com/Mic92/dotfiles)
- [adi1090x/rofi](https://github.com/adi1090x/rofi)
