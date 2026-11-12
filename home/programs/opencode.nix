{ pkgs, ... }:

{
  programs.opencode = {
    enableMcpIntegration = true;
    extraPackages = with pkgs; [ nodejs ];
    settings = {
      default_agent = "plan";
      plugins = [
        "@slkiser/opencode-quota"
      ];
    };
  };
}
