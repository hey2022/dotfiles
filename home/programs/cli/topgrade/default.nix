{ config, ... }:

{
  programs.topgrade = {
    enable = true;
    settings = {
      misc = {
        assume_yes = true;
        disable = [
          "bun"
          "emacs"
          "git_repos"
          "nix"
          "system"
          "uv"
        ];
        pre_sudo = true;
      };
      linux = {
        home_manager_arguments = [
          "--flake"
          "${config.home.dotfiles}"
          "-b"
          "backup"
        ];
      };
      pre_commands = {
        "NixOS upgrade" = "sudo nixos-rebuild switch --flake ${config.home.dotfiles}";
      };
    };
  };
}
