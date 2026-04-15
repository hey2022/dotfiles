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
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "<C-n>";
          run = "shell -- ripdrag %s -xan 2>/dev/null &";
          desc = "Drag and drop selected files";
        }
      ];
    };
  };
  home.packages = with pkgs; [
    parallel
  ];
}
