{ pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      prefix = "C-Space";
      keyMode = "vi";
      escapeTime = 0;
      historyLimit = 10000;
      mouse = true;
      sensibleOnTop = true;
      plugins = with pkgs.tmuxPlugins; [
        continuum
        open
        pain-control
        resurrect
        {
          plugin = vim-tmux-navigator;
          extraConfig = ''
            set -g @vim_navigator_mapping_prev "" 
          '';
        }
        yank
      ];
      extraConfig = ''
        set -g base-index 1
        set -g pane-base-index 1
        set-option -g renumber-windows on

        bind-key -n M-w choose-tree -w
        bind-key -n M-n new-window
        bind-key -n M-q kill-pane
        bind-key -n M-Q kill-session
        bind-key -n M-d detach-client

        bind-key -n M-h previous-window
        bind-key -n M-l next-window
        bind-key -n M-H swap-window -t -1 \; select-window -t -1
        bind-key -n M-L swap-window -t +1 \; select-window -t +1

        bind-key -n M-1 select-window -t 1
        bind-key -n M-2 select-window -t 2
        bind-key -n M-3 select-window -t 3
        bind-key -n M-4 select-window -t 4
        bind-key -n M-5 select-window -t 5
        bind-key -n M-6 select-window -t 6
        bind-key -n M-7 select-window -t 7
        bind-key -n M-8 select-window -t 8
        bind-key -n M-9 select-window -t 9 
        bind-key -n M-0 select-window -t 10

        bind-key -n M-s run-shell "sesh connect \"$(
          sesh list --icons | fzf-tmux -p 80%,70% \
            --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
            --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
            --bind 'tab:down,btab:up' \
            --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
            --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
            --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
            --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
            --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
            --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
            --preview-window 'right:55%' \
            --preview 'sesh preview {}'
        )\""
      '';
    };
    sesh = {
      enable = true;
      enableAlias = false;
      enableTmuxIntegration = false;
    };
  };
}
