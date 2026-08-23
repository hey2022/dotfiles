{
  accounts.email.accounts = {
    "yiheng.he@proton.me" = {
      primary = true;
      realName = "Yiheng He";
      address = "yiheng.he@proton.me";
      userName = "yiheng.he@proton.me";
      imap = {
        host = "localhost";
        port = 1143;
        tls.useStartTls = true;
      };
      smtp = {
        host = "localhost";
        port = 1025;
        tls.useStartTls = true;
      };
      thunderbird.enable = true;
    };
    "Yiheng.He_26@tsinglan.org" = {
      realName = "Yiheng He";
      address = "Yiheng.He_26@tsinglan.org";
      userName = "Yiheng.He_26@tsinglan.org";
      imap = {
        host = "outlook.office365.com";
        port = 993;
      };
      smtp = {
        host = "smtp-mail.outlook.com";
        port = 587;
        tls.useStartTls = true;
      };
      thunderbird = {
        enable = true;
        settings = id: {
          "mail.smtpserver.smtp_${id}.authMethod" = 10; # OAuth2
          "mail.server.server_${id}.authMethod" = 10; # OAuth2
        };
      };
    };
    "he.yiheng@outlook.com" = {
      realName = "Yiheng He";
      address = "he.yiheng@outlook.com";
      userName = "he.yiheng@outlook.com";
      imap = {
        host = "outlook.office365.com";
        port = 993;
      };
      smtp = {
        host = "smtp-mail.outlook.com";
        port = 587;
        tls.useStartTls = true;
      };
      thunderbird = {
        enable = true;
        settings = id: {
          "mail.smtpserver.smtp_${id}.authMethod" = 10; # OAuth2
          "mail.server.server_${id}.authMethod" = 10; # OAuth2
        };
      };
    };
    # https://answers.uillinois.edu/illinois/page.php?id=150086
    "jameyhe2@illinois.edu" = {
      realName = "Yiheng He";
      address = "jameyhe2@illinois.edu";
      userName = "jameyhe2@illinois.edu";
      imap = {
        host = "outlook.office365.com";
        port = 143;
        tls.useStartTls = true;
      };
      smtp = {
        host = "smtp.office365.com";
        port = 587;
        tls.useStartTls = true;
      };
      thunderbird = {
        enable = true;
        settings = id: {
          "mail.smtpserver.smtp_${id}.authMethod" = 10; # OAuth2
          "mail.server.server_${id}.authMethod" = 10; # OAuth2
        };
      };
    };
  };
  programs.thunderbird = {
    enable = true;
    profiles = {
      default = {
        isDefault = true;
      };
    };
    settings = {
      "general.useragent.compatMode.firefox" = true;
      "mail.server.default.check_all_folders_for_new" = true;
    };
  };
  services.protonmail-bridge = {
    enable = true;
  };
}
