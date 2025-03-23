{lib, ...}: {
  imports = [
    ../pipewire.nix
    ../../font
  ];
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = lib.importJSON ./config.json;
    };
    style = builtins.readFile ./style.css;
  };
}
