{ pkgs, ... }:
let
  gitbutler-overlay = final: prev: {
    gitbutler = prev.gitbutler.overrideAttrs (
      finalAttrs: prevAttrs: rec {
        version = "0.14.32";
        src = final.fetchFromGitHub {
          owner = "gitbutlerapp";
          repo = "gitbutler";
          tag = "release/${version}";
          hash = "sha256-Je6a05WumcZ9EnyRJBqoeRup4qIys5DPcEpmK9E54Wg=";
        };
        cargoDeps = final.rustPlatform.fetchCargoVendor {
          inherit src;
          hash = "sha256-qKc4//muhoG/cI8tM3YodoI2DR2EWw4TSA2EHfT//u8=";
        };
        pnpmDeps = final.pnpm.fetchDeps {
          inherit (finalAttrs) pname version src;
          hash = "sha256-81QB6JCk1pHp8jS09kPwpkWteDMNBgCKEOMEtH+upEs=";
        };
      }
    );
  };
in
{
  # nixpkgs.overlays = [gitbutler-overlay];
  home.packages = [ pkgs.gitbutler ];
}
