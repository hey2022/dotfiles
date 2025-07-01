{ ... }:
{
  programs.aria2 = {
    enable = true;
  };
  home.shellAliases = {
    aria2 = "aria2c";
  };
}
