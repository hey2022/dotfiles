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
      }
    ];
  };
}
