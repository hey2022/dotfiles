{config, ...}: {
  imports = [
    ../pipewire.nix
    ../../font
  ];
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./style.css;
  };
  xdg.configFile."waybar/config".source = config.lib.hm.mkFlakeSymlink ./config.json;
}
