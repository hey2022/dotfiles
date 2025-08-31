{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.profiles.productivity.enable {
    home.packages = with pkgs; [
      obsidian
    ];
    xdg.desktopEntries."obsidian" = {
      name = "Obsidian";
      comment = "Knowledge base";
      icon = "obsidian";
      exec = "env -u WAYLAND_DISPLAY obsidian %u";
      categories = [ "Office" ];
      mimeType = [ "x-scheme-handler/obsidian" ];
    };
  };
}
