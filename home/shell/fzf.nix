{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    fd
  ];
  programs.fzf = {
    enable = true;
    defaultCommand = "fd -t f";
  };
}
