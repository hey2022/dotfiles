{
  programs.imv = {
    enable = true;
    settings = {
      binds = {
        "<Delete>" = ''exec rm "$imv_current_file"; close'';
      };
    };
  };
  # HACK: https://github.com/catppuccin/nix/issues/392 IFD
  catppuccin.imv.enable = false;
}
