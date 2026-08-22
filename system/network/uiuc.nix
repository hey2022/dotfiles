{ inputs, config, ... }:
{
  sops.secrets = {
    "uiuc-network" = {
      sopsFile = "${inputs.self}/secrets/root/uiuc.env";
      format = "dotenv";
    };
  };

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [
      config.sops.secrets."uiuc-network".path
    ];
    profiles = {
      IllinoisNet = {
        connection = {
          id = "IllinoisNet";
          type = "wifi";
        };
        wifi = {
          mode = "infrastructure";
          ssid = "IllinoisNet";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-eap";
        };
        "802-1x" = {
          eap = "peap;";
          phase2-auth = "mschapv2";
          domain-suffix-match = "wireless.illinois.edu";
          identity = "$USERNAME";
          password = "$PASSWORD";
          ca-cert = builtins.fetchurl {
            url = "https://go.illinois.edu/wificert";
            sha256 = "sha256-VE+vcdS18kyHe3IGN3K1hq0QwhP0gI6Q7x5Dtli+gII=";
          };
        };
        ipv4 = {
          method = "auto";
        };
        ipv6 = {
          method = "auto";
          addr-gen-mode = "default";
        };
      };
    };
  };
}
