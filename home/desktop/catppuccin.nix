{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    fcitx5.apply = false;
    hyprlock.useDefaultConfig = false;
    wezterm.apply = true;
    tmux.extraConfig = ''
      set -g @catppuccin_window_status_style "rounded"
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_host}"
    '';
  };
}
