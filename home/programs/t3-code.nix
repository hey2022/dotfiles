{ pkgs, lib, ... }:

{
  programs.t3code = {
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
