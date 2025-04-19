{config, ...}: {
  programs.topgrade = {
    enable = true;
    settings = {
      misc = {
        assume_yes = true;
        disable = [
          "bun"
          "git_repos"
          "nix"
          "uv"
        ];
        no_retry = true;
        pre_sudo = true;
      };
      linux = {
        nix_arguments = "--flake ${config.home.dotfiles}";
        home_manager_arguments = ["--flake" "${config.home.dotfiles}" "-b" "backup"];
      };
      pre_commands = {
        "Update flake" = "nix flake update --flake ${config.home.dotfiles}";
      };
    };
  };
}
