{ inputs, ... }:

{
  perSystem =
    {
      config,
      lib,
      pkgs,
      system,
      ...
    }:
    let
      typixLib = inputs.typix.lib.${system};
      src = typixLib.cleanTypstSource ../.;
      commonArgs = {
        typstSource = "main.typ";

        # Add paths to fonts here
        fontPaths = [ ];

        # Add paths that must be locally accessible to typst here
        virtualPaths = [ ];
      };

      unstable_typstPackages = [ ];

      mkTypstPackagesDrv =
        name: entries:
        let
          linkFarmEntries = lib.foldl (
            set:
            {
              name,
              version,
              namespace,
              input,
            }:
            set
            // {
              "${namespace}/${name}/${version}" = input;
            }
          ) { } entries;
        in
        pkgs.linkFarm name linkFarmEntries;

      unpublishedTypstPackages = mkTypstPackagesDrv "unpublished-typst-packages" [ ];

      # Compile a Typst project, *without* copying the result to the current directory
      build-drv = typixLib.buildTypstProject (
        commonArgs
        // {
          inherit src unstable_typstPackages;
          TYPST_PACKAGE_PATH = unpublishedTypstPackages;
        }
      );

      # Compile a Typst project, and then copy the result to the current directory
      build-script = typixLib.buildTypstProjectLocal (
        commonArgs
        // {
          inherit src unstable_typstPackages;
          TYPST_PACKAGE_PATH = unpublishedTypstPackages;
        }
      );

      # Watch a project and recompile on changes
      watch-script = typixLib.watchTypstProject (
        commonArgs
        // {
          typstWatchCommand = "TYPST_PACKAGE_PATH=${lib.strings.escapeShellArg unpublishedTypstPackages} typst watch";
        }
      );
    in
    {
      checks = {
        inherit build-drv build-script watch-script;
      };
      packages.default = build-drv;
      apps = rec {
        default = watch;
        build.program = build-script;
        watch.program = watch-script;
      };

      devShells.default = typixLib.devShell {
        inherit (commonArgs) fontPaths virtualPaths;
        shellHook = ''
          ${config.pre-commit.shellHook}
          export TYPST_PACKAGE_PATH=${lib.escapeShellArg unpublishedTypstPackages}
        '';
        packages =
          with pkgs;
          [
            tinymist
            typst
            typstyle
          ]
          ++ config.pre-commit.settings.enabledPackages;
      };
    };
}
