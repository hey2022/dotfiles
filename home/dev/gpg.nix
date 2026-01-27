{ pkgs, ... }:
{
  programs.gpg = {
    enable = true;
  };
  # If no pinentry run `gpgconf --reload gpg-agent`
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-qt;
  };
}
