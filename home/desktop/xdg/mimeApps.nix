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
      "text/html" = ["zen-beta.desktop" "firefox.desktop"];
      "x-scheme-handler/http" = ["zen-beta.desktop" "firefox.desktop"];
      "x-scheme-handler/https" = ["zen-beta.desktop" "firefox.desktop"];
    };
  };
}
