{ pkgs, ... }:

{
  packages = [ pkgs.nur.repos.rycee.firefox-addons.sidebery ];
  settings."{3c078156-979c-498b-8990-85f7987dd929}".settings = {
    "sidebarCSS" = builtins.readFile ./style.css;
    sidebar = {
      nav = [
        "tabs"
        "dev"
        "school"
        "application"
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
        school = {
          name = "school";
          id = "school";
          type = 2;
          color = "purple";
          iconSVG = "icon_edu";
        };
        application = {
          name = "application";
          id = "application";
          type = 2;
          color = "red";
          iconSVG = "icon_clipboard";
        };
      };
    };
  };
}
