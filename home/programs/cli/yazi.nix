{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    settings = {
      opener = {
        open = [
          {
            run = "parallel -j 0 xdg-open ::: \"$@\"";
            orphan = true;
            desc = "Open";
            for = "unix";
          }
        ];
      };
    };
  };
  home.packages = with pkgs; [
    parallel
  ];
}
