{ config, ... }:

{
  programs.topgrade = {
    enable = true;
    settings = {
      misc = {
        assume_yes = true;
        disable = [
          "bun"
          "doom"
          "git_repos"
          "nix"
          "uv"
        ];
        pre_sudo = true;
      };
      linux = {
        nix_arguments = "--flake ${config.home.dotfiles}";
        home_manager_arguments = [
          "--flake"
          "${config.home.dotfiles}"
          "-b"
          "backup"
        ];
      };
    };
  };
}
