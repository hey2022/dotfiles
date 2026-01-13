{
  xdg.mimeApps = {
    enable = true;
    # MIME type: xdg-mime query filetype <file>
    # desktop files location: ~/.nix-profile/share/applications/
    defaultApplications = {
      "application/json" = "emacsclient.desktop";
      "application/pdf" = [
        "sioyek.desktop"
        "org.pwmt.zathura.desktop"
      ];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
      "application/application/vnd.oasis.opendocument.text" = "writer.desktop";
      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/svg+xml" = "org.inkscape.Inkscape.desktop";
      "text/plain" = "emacsclient.desktop";
      "text/html" = [
        "zen-beta.desktop"
        "firefox.desktop"
      ];
      "x-scheme-handler/http" = [
        "zen-beta.desktop"
        "firefox.desktop"
      ];
      "x-scheme-handler/https" = [
        "zen-beta.desktop"
        "firefox.desktop"
      ];
    };
  };
}
