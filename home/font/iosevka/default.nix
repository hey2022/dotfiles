{pkgs, ...}: {
  home.packages = with pkgs; [
    (iosevka.override {
      privateBuildPlan = builtins.readFile ./private-build-plans.toml;
      set = "Custom";
    })

    (iosevka.override {
      privateBuildPlan = builtins.readFile ./private-build-plans.toml;
      set = "ProportionalCustom";
    })
  ];
}
