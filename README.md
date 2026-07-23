<h1 align="center">hey2022/dotfiles</h1>

Cooked configs for NixOS and Home-Manager using [flake-parts](https://github.com/hercules-ci/flake-parts).

See an overview of the flake outputs by running
`nix flake show github:hey2022/dotfiles`.

Project documentation can be found [here](./docs/).

## 🗃️ Architecture

The architecture of this flake is designed around the concepts of [roles, profiles, and components](https://help.puppet.com/core/current/Content/PuppetCore/configuring_roles_and_profiles.htm). It isolates implementation code from decision-making logic, allowing configurations to remain modular and clean.

- Roles: The entry point for each machine is found in [hosts](./hosts), where it is split into system NixOS `configuration.nix` and user Home-Manager `home.nix` roles. They act as the top-level configuration that assign a specific identity and functional purpose to a hardware target.

- Profiles: Configurable options are where profiles come into play. You can find them in [.system/profiles](./system/profiles/) and [./home/profiles](./home/profiles/). While most shared configurations across all machines are enabled by default, profiles act as a control layer defining high-level group options to enable extra sets of programs on or off.

- Components: NixOS configurations live in [./system](./system) and Home Manager configurations live in [./home](./home). They define localized program configurations while remaining agnostic of the machines running them. Following the principle of [Locality of Behaviour (LoB)](https://htmx.org/essays/locality-of-behaviour/), each component uses a `lib.mkIf` condition tied to the high-level profile options to evaluate its configuration when that profile is enabled. Note that upstream NixOS or Home Manager modules already handle conditional evaluation internally via their own `enable` switches, so components can often skip the redundant `lib.mkIf` wrappers and just declare configuration while profiles handle the enabling.

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
