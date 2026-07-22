{ pkgs, ... }:

{
  packages = [ pkgs.nur.repos.rycee.firefox-addons.sidebery ];
  # Can convert json to nix with
  # nix eval --expr "builtins.fromJSON ''$(wl-paste)''"
  settings."{3c078156-979c-498b-8990-85f7987dd929}".settings = {
    "sidebarCSS" = builtins.readFile ./style.css;
    sidebar = {
      nav = [
        "tabs"
        "dev"
        "uiuc"
        "add_tp"
        "sp-0"
        "settings"
      ];
      panels = {
        tabs = {
          name = "Tabs";
          id = "tabs";
          type = 2;
          color = "toolbar";
          iconSVG = "icon_tabs";
        };
        dev = {
          name = "dev";
          id = "dev";
          type = 2;
          color = "blue";
          iconSVG = "icon_code";
        };
        uiuc = {
          name = "UIUC";
          id = "uiuc";
          type = 2;
          iconIMGSrc = "https://cdn.brand.illinois.edu/favicon.ico";
          iconIMG = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABAklEQVRIS2NkQALCOt5BvAx/1giz/EIWJpr9+jcbwxcGDs93VzfuhGliRLcgWvDJ2g6FG0Qbiqww564Ow4aPMh54LYgTery2T/E6WRak3dFlWPtBdrhbYMj+cY2n4GtwEPEy/2GIEXvCyMn0D2uQffnLzLDklcz/b/+YwfIb3okzXP0piDuSpXR9NX78+ReKlAJCN6if0bHhf4eSGGDyu96L/I+6bXTuPwPDRpgYy2/WZa/ubLiLNRWhO1NI03v5OrWz4fYCb7FasO2d6P/Y24Zz3t3YmoYrVWDVCFM8agEoJEaDaDQVUTmj0byoANVoNC3sQBaMVjgEq0yaV/rUbrYAAKLNNCgLaVrPAAAAAElFTkSuQmCC";
        };
      };
    };
  };
}
