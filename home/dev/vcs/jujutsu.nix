{
  nixpkgs.overlays = [
    (final: prev: {
      jujutsu = prev.jujutsu.overrideAttrs rec {
        # HACK: git-lfs: add ability to ignore files based on git attributes https://github.com/jj-vcs/jj/pull/9635
        version = "0.42.0";
        src = prev.fetchFromGitHub {
          owner = "jj-vcs";
          repo = "jj";
          rev = "cf6c9db88f0d10c47515d3eba2aee3f9b3fcb463";
          hash = "sha256-5HCpqRUbnkmECj9OYZsnfmudHOBCdmzsnnMjH1CU6NY=";
        };
        cargoDeps = final.rustPlatform.fetchCargoVendor {
          inherit src;
          hash = "sha256-wyaFOMSpJqe4BMHsYFp2+JjUWphpQ64QbE/Am2V4D5A=";
        };
      };
    })
  ];
  programs = {
    jujutsu = {
      enable = true;
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
        };
      };
    };
    jjui = {
      enable = true;
    };
    difftastic = {
      enable = true;
      jujutsu.enable = true;
    };
    mergiraf = {
      enable = true;
      enableJujutsuIntegration = true;
    };
  };
}
