{ pkgs, ... }:
{
  IosevkaCustom = pkgs.iosevka.override {
    privateBuildPlan = builtins.readFile ./private-build-plans.toml;
    set = "Custom";
  };

  IosevkaProportionalCustom = pkgs.iosevka.override {
    privateBuildPlan = builtins.readFile ./private-build-plans.toml;
    set = "ProportionalCustom";
  };
}
