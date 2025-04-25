{config, ...}: {
  imports = [
    ../pipewire.nix
    ../../font
  ];
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = "@import \"./config.css\";";
  };
  xdg.configFile."waybar/config".source = config.lib.hm.mkFlakeSymlink ./config.json;
  xdg.configFile."waybar/config.css".source = config.lib.hm.mkFlakeSymlink ./style.css;
}
