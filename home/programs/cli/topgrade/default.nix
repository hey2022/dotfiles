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
          "hyprpm"
          "nix"
          "system"
          "uv"
          "vcpkg"
        ];
        pre_sudo = true;
      };
      firmware = {
        upgrade = true;
      };
      commands = {
        "NixOS switch" = "nh os switch";
        "Home-Manager switch" = "nh home switch -b backup";
      };
    };
  };
}
