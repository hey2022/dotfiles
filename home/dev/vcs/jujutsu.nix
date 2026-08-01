{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.programs.jujutsu;
in
{
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      nixpkgs.overlays = [
        (final: prev: {
          jujutsu = prev.jujutsu.overrideAttrs rec {
            # HACK: git-lfs: add ability to ignore files based on git attributes https://github.com/jj-vcs/jj/pull/9635
            version = "0.43.0";
            src = prev.fetchFromGitHub {
              owner = "jj-vcs";
              repo = "jj";
              rev = "263ba237ff13ca4b85dc490aee797713b990810e";
              hash = "sha256-c7uv+5b/n+WphNXPKHu5Ta+n19WcP7r1kBvfBLrQ1A8=";
            };
            cargoDeps = final.rustPlatform.fetchCargoVendor {
              inherit src;
              hash = "sha256-wP3u+kxVfu1bYEKtHq5eqSoiPAFSyEXagHo7Xj8rzys=";
            };
          };
        })
      ];
      programs = {
        jujutsu = {
          settings = {
            user = {
              email = "yiheng.he@proton.me";
              name = "Yiheng He";
            };
            signing = {
              behavior = "own";
              backend = "gpg";
            };
            ui = {
              editor = "nvim";
            };
            revsets = {
              log = "all()";
            };
            revset-aliases = {
              "closest_merge(to)" = "heads(::to & merges())";
            };
            aliases = {
              tug = [
                "bookmark"
                "move"
                "--from"
                "heads(::@- & bookmarks())"
                "--to"
                "@-"
              ];
              # https://isaaccorbrey.com/notes/jujutsu-megamerges-for-fun-and-profit
              stack = [
                "rebase"
                "--after"
                "trunk()"
                "--before"
                "closest_merge(@)"
                "--revision"
              ];
              # https://isaaccorbrey.com/notes/jujutsu-megamerges-for-fun-and-profit
              stage = [
                "stack"
                "closest_merge(@)+:: ~ empty()"
              ];
              # https://isaaccorbrey.com/notes/jujutsu-megamerges-for-fun-and-profit
              restack = [
                "rebase"
                "--onto"
                "trunk()"
                "--source"
                "roots(trunk()..) & mutable()"
                "--simplify-parents"
              ];
              # https://github.com/acarapetis/jj-pre-push
              push = [
                "util"
                "exec"
                "--"
                "jj-pre-push"
                "push"
              ];
            };
          };
        };
        jjui = {
          enable = true;
          settings = {
            # https://github.com/acarapetis/jj-pre-push
            actions = [
              {
                name = "jj-push";
                lua = ''
                  jj_async("push")
                  revisions.refresh()
                '';
              }
              {
                name = "jj-push-selected";
                lua = ''
                  jj_async("push", "-r", context.commit_id())
                  revisions.refresh()
                '';
              }
            ];
            bindings = [
              {
                action = "jj-push";
                desc = "jj push";
                scope = "revisions";
                seq = [
                  "x"
                  "p"
                ];
              }
              {
                action = "jj-push-selected";
                desc = "jj push selected bookmark(s)";
                scope = "revisions";
                seq = [
                  "x"
                  "P"
                ];
              }
            ];
          };
        };
      };
      home.packages = [ pkgs.jj-pre-push ];
    })
    {
      programs = {
        difftastic.jujutsu.enable = true;
        mergiraf.enableJujutsuIntegration = true;
      };
    }
  ];
}
