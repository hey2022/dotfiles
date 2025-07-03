{
  inputs,
  config,
  ...
}:
{
  imports = [
    "${inputs.self}/home/dev/emacs"
  ];
  xdg.configFile."tridactyl/tridactylrc".source = config.lib.hm.mkFlakeSymlink ./tridactylrc;
}
