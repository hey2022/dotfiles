{ lib, ... }:
{
  imports = [
    ./ollama.nix
    ./open-webui.nix
  ];
  options.profiles.ai = {
    enable = lib.mkEnableOption "AI profile";
  };
}
