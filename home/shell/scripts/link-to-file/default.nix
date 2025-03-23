{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellApplication {
      name = "link-to-file";
      text = builtins.readFile ./link-to-file.sh;
    })
  ];
}
