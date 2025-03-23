{pkgs, ...}: {
  imports = [
    ./dnscrypt.nix
    ./nm-applet.nix
  ];
  networking = {
    nftables.enable = true;
    networkmanager.enable = true;
  };

  # https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online = {
    serviceConfig = {
      ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
    };
  };
}
