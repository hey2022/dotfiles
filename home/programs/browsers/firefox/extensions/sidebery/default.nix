{ pkgs, ... }:

{
  packages = [ pkgs.nur.repos.rycee.firefox-addons.sidebery ];
  settings."{3c078156-979c-498b-8990-85f7987dd929}".settings = {
    "sidebarCSS" = builtins.readFile ./style.css;
  };
}
