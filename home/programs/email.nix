{ pkgs, ... }:
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
        tls.enable = false;
      };
      smtp = {
        host = "localhost";
        port = 1025;
        tls.enable = false;
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
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
          "mail.server.server_${id}.authMethod" = 10;
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
  };
  home.packages = [
    pkgs.hydroxide
  ];
  systemd.user.services."hydroxide" = {
    Unit = {
      Description = "A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge";
      Wants = "network-online.target";
      After = "network-online.target";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStart = "${pkgs.hydroxide}/bin/hydroxide --carddav-port 5232 serve";
      Restart = "always";
    };
  };
}
