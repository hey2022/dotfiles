{
  inputs,
  pkgs,
  ...
}: let
  profile = "default";
in {
  imports = [
    inputs.zen-browser.homeModules.beta
    ../firefox/extensions
  ];
  programs.zen-browser = {
    enable = true;
    profiles.${profile} = {
      isDefault = true;
      userChrome = builtins.readFile "${inputs.zen-browser-catppuccin}/themes/Mocha/Mauve/userChrome.css";
      userContent = builtins.readFile "${inputs.zen-browser-catppuccin}/themes/Mocha/Mauve/userContent.css";
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          aw-watcher-web
          keepassxc-browser
          languagetool
          libredirect
          redirector
          sponsorblock
          stylus
          tridactyl
          ublock-origin
          zotero-connector
        ];
      };
    };
  };
  home.file = {
    ".zen/${profile}/chrome/zen-logo-mocha.svg".source = "${inputs.zen-browser-catppuccin}/themes/Mocha/Mauve/zen-logo-mocha.svg";
  };
}
