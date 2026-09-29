{
  flake.templates = rec {
    default = base;
    base = {
      path = ./base;
      description = "Base Flake Template";
    };
    typst = {
      path = ./typst;
      description = "Typst Flake Template";
    };
    typix = {
      path = ./typix;
      description = "Typix Flake Template";
    };
  };
}
