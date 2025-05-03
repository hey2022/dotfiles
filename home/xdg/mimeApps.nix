{...}: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/svg+xml" = "org.inkscape.Inkscape.desktop";
      "text/plain" = "emacsclient.desktop";
    };
  };
}
