{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellApplication {
      name = "reshade-steam-proton";
      runtimeInputs = with pkgs; [
        curl
        file
        git
        gnugrep
        p7zip
        wine
      ];
      text = builtins.readFile (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/kevinlekiller/reshade-steam-proton/refs/heads/main/reshade-linux.sh";
        sha256 = "089rw5sw30xlz6426nrv2d2zhdvcw017hcnhvxjkk5igc1fpvp0r";
      });
      bashOptions = ["errexit" "pipefail"];
      checkPhase = "";
    })
  ];
}
