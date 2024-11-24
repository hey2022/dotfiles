{pkgs, ...}: {
  imports = [./dnscrypt.nix];
  networking.networkmanager.enable = true;

  # https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online = {
    serviceConfig = {
      ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
    };
  };
}
