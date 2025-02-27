{pkgs, ...}: {
  services.swww.enable = true;
  home.packages = [
    (pkgs.writeShellApplication {
      name = "swww-picker";
      runtimeInputs = [pkgs.fuzzel];
      text = builtins.readFile ./swww-picker.sh;
    })
  ];
}
