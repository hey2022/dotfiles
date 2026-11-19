{ pkgs, ... }:

{
  programs.opencode = {
    enableMcpIntegration = true;
    extraPackages = with pkgs; [ nodejs ];
    context = ../dev/ai/AGENTS.md;
    settings = {
      default_agent = "plan";
      plugins = [
        "@slkiser/opencode-quota"
      ];
    };
  };
}
