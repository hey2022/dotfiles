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
          "home_manager"
          "nix"
          "nix_helper"
          "system"
          "uv"
        ];
        pre_sudo = true;
      };
      commands = {
        "NixOS switch" = "nh os switch";
        "Home-Manager switch" = "nh home switch -b backup";
      };
    };
  };
}
