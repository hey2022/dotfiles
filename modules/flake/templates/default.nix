{
  flake.templates = rec {
    default = base;
    base = {
      path = ./base;
      description = "Base Flake Template";
    };
  };
}
