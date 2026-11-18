{ pkgs, ... }:

{
  security.polkit.enable = true;
  environment.etc."polkit-1/actions/org.keepassxc.KeePassXC.policy".source =
    "${pkgs.keepassxc}/share/polkit-1/actions/org.keepassxc.KeePassXC.policy";
}
