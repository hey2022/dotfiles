{
  config,
  pkgs,
  ...
}: {
  imports = [../.];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtra = builtins.readFile ./.zshrc;
    history.ignoreDups = true;
  };
}
