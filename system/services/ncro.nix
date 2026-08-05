{ inputs, lib, ... }:

let
  port = 8501;
in
{
  imports = [ inputs.ncro.nixosModules.default ];
  services.ncro = {
    enable = true;
    settings = {
      server = {
        listen = ":${toString port}";
      };
      upstreams =
        lib.map
          (
            upstream:
            upstream
            // {
              filters = (upstream.filters or [ ]) ++ [
                {
                  action = "deny";
                  field = "name";
                  pattern = "*-source";
                }
              ];
            }
          )
          [
            {
              url = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store";
              priority = 10;
              public_key = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
            }
            {
              url = "https://mirrors.ustc.edu.cn/nix-channels/store";
              priority = 15;
              public_key = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
            }
            {
              url = "https://cache.nixos.org";
              priority = 20;
              public_key = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
            }
            {
              url = "https://nix-community.cachix.org";
              priority = 25;
              public_key = "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
            }
            {
              url = "https://cache.hey2022.dev";
              priority = 30;
              public_key = "cache.hey2022.dev:jjEoh4E8SFmnwrDvEPQRF3aTj/Y4iNzWj6PkdlBAyGY=";
            }
            {
              url = "https://nyx-cache.chaotic.cx";
              priority = 40;
              public_key = "nyx-cache.chaotic.cx:dJxTrgMC3V3cFfyIiBQDQorG6k1LsqurH/srpMSq7qk=";
            }
            {
              url = "https://hyprland.cachix.org";
              priority = 50;
              public_key = "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=";
              filters = [
                {
                  action = "allow";
                  field = "name";
                  pattern = "*hyprland*";
                }
              ];
            }
          ];
      logging.timestamps = false;
    };
  };

  nix.settings.substituters = lib.mkForce [ "http://localhost:${toString port}" ];
}
