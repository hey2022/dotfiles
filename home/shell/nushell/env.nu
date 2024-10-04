$env.PATH = (
  $env.PATH
  | split row (char esep)
  | append ($env.HOME | path join .cargo bin)
  | append ($env.HOME | path join .config emacs bin)
  | uniq # filter so the paths are unique
)

$env.ALTERNATE_EDITOR = ""
$env.VISUAL = "emacsclient -c"
$env.EDITOR = "emacsclient -nw"
$env.SSH_AUTH_SOCK = ($env.XDG_RUNTIME_DIR | path join ssh-agent.socket)
$env.QT_QPA_PLATFORMTHEME = "qt5ct"

$env.GTK_IM_MODULE = "fcitx"
$env.QT_IM_MODULE = "fcitx"
$env.XMODIFIERS = "@im=fcitx"

$env.FLAKE = ($env.HOME | path join .dotfiles)
