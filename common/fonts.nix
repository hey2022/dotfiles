{ pkgs, ... }:
{
  IosevkaCustom = pkgs.iosevka.override {
    privateBuildPlan = builtins.readFile ../home/font/iosevka/private-build-plans.toml;
    set = "Custom";
  };

  IosevkaProportionalCustom = pkgs.iosevka.override {
    privateBuildPlan = builtins.readFile ../home/font/iosevka/private-build-plans.toml;
    set = "ProportionalCustom";
  };
}
