{config, ...}: {
  programs.topgrade = {
    enable = true;
    settings = {
      misc = {
        assume_yes = true;
        disable = ["bun"];
      };
      linux = {
        nix_arguments = "--flake ${config.home.dotfiles}";
        home_manager_arguments = ["--flake" "${config.home.dotfiles}" "-b" "backup"];
      };
    };
  };
}
