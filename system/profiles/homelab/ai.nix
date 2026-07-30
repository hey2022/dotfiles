{
  config,
  lib,
  ...
}:
let
  cfg = config.profiles.homelab.ai;
in
{
  options = {
    profiles.homelab.ai.enable = lib.mkEnableOption "Local LLM setup";
  };
  config = lib.mkIf cfg.enable {
    services = {
      ollama.enable = true;
      open-webui.enable = true;
    };
  };
}
