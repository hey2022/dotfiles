{inputs, ...}: {
  imports = [inputs.nix-flatpak.homeManagerModules.nix-flatpak];
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    update.onActivation = true;
    remotes = [
      {
        name = "flathub";
        location = "https://mirrors.sjtug.sjtu.edu.cn/flathub";
        gpg-import = builtins.fetchurl {
          url = "https://mirror.sjtu.edu.cn/flathub/flathub.gpg";
          sha256 = "1amf8767ipfvyb31k7lr2s3i793s1vz5psqb8sb0g771qjmj1p4b";
        };
      }
    ];
  };
}
