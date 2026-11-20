{ pkgs, lib, ... }:

{
  programs.t3code = {
    server = {
      enable = true;
      extraArgs = [
        "--host"
        "0.0.0.0"
      ];
    };
    userSettings.providerInstances.deepseek = {
      driver = "acpRegistry";
      displayName = "DeepSeek Harness";
      config = {
        source = "local";
        commandPath = lib.getExe pkgs.deepseek-harness;
        commandArgs = [
          "--profile"
          "acp"
        ];
      };
    };
  };
}
