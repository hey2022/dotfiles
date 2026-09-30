{ inputs, pkgs, ... }:

{
  packages = [ pkgs.nur.repos.rycee.firefox-addons.violentmonkey ];
  settings."{aecec67f-0d10-4fa7-b7c7-609a2db280cf}".settings = {
    "scr:1" = {
      config = {
        enabled = 1;
        shouldUpdate = 0;
      };
      meta = {
        name = "nixpkgs-review-gha";
        match = [ "https://github.com/*" ];
        runAt = "document-idle";
      };
    };
    "code:1" = builtins.readFile "${inputs.userscript-nixpkgs-review-gha}/shortcut.user.js";
  };
}
