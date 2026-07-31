{ pkgs, ... }:

{
  packages = [ pkgs.nur.repos.rycee.firefox-addons.redirector ];
  settings."redirector@einaregilsson.com".settings = {
    "enableNotifications" = false;
    "redirects" = [
      {
        "description" = "NixOS wiki redirect";
        "exampleUrl" = "https://nixos.wiki/wiki/Main_Page";
        "exampleResult" = "https://wiki.nixos.org/wiki/Main_Page";
        "error" = null;
        "includePattern" = "https://nixos.wiki/*";
        "excludePattern" = "";
        "patternDesc" = "Any word after example.com leads to google search for that word.";
        "redirectUrl" = "https://wiki.nixos.org/$1";
        "patternType" = "W";
        "processMatches" = "noProcessing";
        "disabled" = false;
        "grouped" = false;
        "appliesTo" = [
          "main_frame"
        ];
      }
    ];
  };
}
