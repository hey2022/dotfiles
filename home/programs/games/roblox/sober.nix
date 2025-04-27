{
  config,
  lib,
  ...
}: {
  services.flatpak.packages = ["org.vinegarhq.Sober"];
  home.activation.sober-config = lib.hm.dag.entryAfter ["writeBoundary"] ''
    install -D ${config.home.dotfiles}/home/programs/games/roblox/config.json ${config.home.homeDirectory}/.var/app/org.vinegarhq.Sober/config/sober/config.json
  '';
}
