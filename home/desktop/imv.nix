{
  programs.imv = {
    enable = true;
    settings = {
      binds = {
        "<Delete>" = ''exec rm "$imv_current_file"; close'';
      };
    };
  };
}
