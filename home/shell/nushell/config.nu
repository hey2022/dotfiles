$env.config = {
  show_banner: false,
}

if "TMUX" not-in $env {
  tmux new-session -A -s main
}
