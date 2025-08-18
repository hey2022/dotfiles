{ inputs, ... }@attrs:
let
  inherit (inputs) nixpkgs;
  inherit (inputs.nixCats) utils;
  luaPath = ./.;
  # this is flake-utils eachSystem
  forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
  # the following extra_pkg_config contains any values
  # which you want to pass to the config set of nixpkgs
  # import nixpkgs { config = extra_pkg_config; inherit system; }
  # will not apply to module imports
  # as that will have your system values
  extra_pkg_config = {
    # allowUnfree = true;
  };
  # management of the system variable is one of the harder parts of using flakes.

  # so I have done it here in an interesting way to keep it out of the way.
  # It gets resolved within the builder itself, and then passed to your
  # categoryDefinitions and packageDefinitions.

  # this allows you to use ${pkgs.system} whenever you want in those sections
  # without fear.

  # see :help nixCats.flake.outputs.overlays
  dependencyOverlays = # (import ./overlays inputs) ++
    [
      # This overlay grabs all the inputs named in the format
      # `plugins-<pluginName>`
      # Once we add this overlay to our nixpkgs, we are able to
      # use `pkgs.neovimPlugins`, which is a set of our plugins.
      (utils.standardPluginOverlay inputs)
      # add any other flake overlays here.

      # when other people mess up their overlays by wrapping them with system,
      # you may instead call this function on their overlay.
      # it will check if it has the system in the set, and if so return the desired overlay
      # (utils.fixSystemizedOverlay inputs.codeium.overlays
      #   (system: inputs.codeium.overlays.${system}.default)
      # )
    ];

  # see :help nixCats.flake.outputs.categories
  # and
  # :help nixCats.flake.outputs.categoryDefinitions.scheme
  categoryDefinitions =
    {
      pkgs,
      settings,
      categories,
      extra,
      name,
      mkPlugin,
      ...
    }@packageDef:
    {
      # to define and use a new category, simply add a new list to a set here,
      # and later, you will include categoryname = true; in the set you
      # provide when you build the package using this builder function.
      # see :help nixCats.flake.outputs.packageDefinitions for info on that section.

      # lspsAndRuntimeDeps:
      # this section is for dependencies that should be available
      # at RUN TIME for plugins. Will be available to PATH within neovim terminal
      # this includes LSPs
      lspsAndRuntimeDeps = {
        # some categories of stuff.
        general = with pkgs; [
          universal-ctags
          ripgrep
          fd
          zoxide
        ];
        # these names are arbitrary.
        lint = with pkgs; [
        ];
        # but you can choose which ones you want
        # per nvim package you export
        debug = with pkgs; {
        };
        cpp = with pkgs; [
          clang-tools
        ];
        statistics = with pkgs; [
          quarto
        ];
        # and easily check if they are included in lua
        format = with pkgs; [
          stylua
          nixfmt
        ];
        neonixdev = {
          # also you can do this.
          inherit (pkgs) nix-doc lua-language-server nixd;
          # and each will be its own sub category
        };
      };

      # This is for plugins that will load at startup without using packadd:
      startupPlugins = {
        debug = with pkgs.vimPlugins; [
          nvim-nio
        ];
        general = with pkgs.vimPlugins; {
          # you can make subcategories!!!
          # (always isnt a special name, just the one I chose for this subcategory)
          always = [
            lze
            lzextras
            vim-repeat
            plenary-nvim
            nvim-notify
          ];
          extra = [
            oil-nvim
            nvim-web-devicons
          ];
        };
        # You can retreive information from the
        # packageDefinitions of the package this was packaged with.
        # :help nixCats.flake.outputs.categoryDefinitions.scheme
        themer =
          with pkgs.vimPlugins;
          (builtins.getAttr (categories.colorscheme or "onedark") {
            # Theme switcher without creating a new category
            "onedark" = onedark-nvim;
            "catppuccin" = catppuccin-nvim;
            "catppuccin-mocha" = catppuccin-nvim;
            "tokyonight" = tokyonight-nvim;
            "tokyonight-day" = tokyonight-nvim;
          });
        # This is obviously a fairly basic usecase for this, but still nice.
      };

      # not loaded automatically at startup.
      # use with packadd and an autocommand in config to achieve lazy loading
      # or a tool for organizing this like lze or lz.n!
      # to get the name packadd expects, use the
      # `:NixCats pawsible` command to see them all
      optionalPlugins = {
        debug = with pkgs.vimPlugins; {
          # it is possible to add default values.
          # there is nothing special about the word "default"
          # but we have turned this subcategory into a default value
          # via the extraCats section at the bottom of categoryDefinitions.
          default = [
            nvim-dap
            nvim-dap-ui
            nvim-dap-virtual-text
          ];
        };
        lint = with pkgs.vimPlugins; [
          nvim-lint
        ];
        format = with pkgs.vimPlugins; [
          conform-nvim
        ];
        markdown = with pkgs.vimPlugins; [
          markdown-preview-nvim
        ];
        zettelkasten = with pkgs.vimPlugins; [
          obsidian-nvim
        ];
        neonixdev = with pkgs.vimPlugins; [
          lazydev-nvim
        ];
        statistics = with pkgs.vimPlugins; [
          quarto-nvim
          otter-nvim
        ];
        typst = with pkgs.vimPlugins; [
          typst-preview-nvim
        ];
        general = {
          blink = with pkgs.vimPlugins; [
            luasnip
            friendly-snippets
            cmp-cmdline
            blink-cmp
            blink-compat
            colorful-menu-nvim
          ];
          treesitter = with pkgs.vimPlugins; [
            nvim-treesitter-textobjects
            nvim-treesitter.withAllGrammars
            # This is for if you only want some of the grammars
            # (nvim-treesitter.withPlugins (
            #   plugins: with plugins; [
            #     nix
            #     lua
            #   ]
            # ))
          ];
          telescope = with pkgs.vimPlugins; [
            telescope-fzf-native-nvim
            telescope-ui-select-nvim
            telescope-file-browser-nvim
            telescope-zoxide
            telescope-nvim
          ];
          always = with pkgs.vimPlugins; [
            nvim-lspconfig
            lualine-nvim
            barbar-nvim
            gitsigns-nvim
            neogit
            diffview-nvim
            vim-sleuth
            vim-rhubarb
            nvim-surround
            nvim-autopairs
          ];
          extra = with pkgs.vimPlugins; [
            fidget-nvim
            # lualine-lsp-progress
            which-key-nvim
            comment-nvim
            undotree
            indent-blankline-nvim
            vim-startuptime
            toggleterm-nvim
            dashboard-nvim
            # If it was included in your flake inputs as plugins-hlargs,
            # this would be how to add that plugin in your config.
            # pkgs.neovimPlugins.hlargs
          ];
          ai = with pkgs.vimPlugins; [
            supermaven-nvim
          ];
        };
      };

      # shared libraries to be added to LD_LIBRARY_PATH
      # variable available to nvim runtime
      sharedLibraries = {
        general = with pkgs; [
          # <- this would be included if any of the subcategories of general are
          # libgit2
        ];
      };

      # environmentVariables:
      # this section is for environmentVariables that should be available
      # at RUN TIME for plugins. Will be available to path within neovim terminal
      environmentVariables = {
        test = {
          default = {
            CATTESTVARDEFAULT = "It worked!";
          };
          subtest1 = {
            CATTESTVAR = "It worked!";
          };
          subtest2 = {
            CATTESTVAR3 = "It didn't work!";
          };
        };
      };

      # If you know what these are, you can provide custom ones by category here.
      # If you dont, check this link out:
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
      extraWrapperArgs = {
        test = [
          ''--set CATTESTVAR2 "It worked again!"''
        ];
      };

      # lists of the functions you would have passed to
      # python.withPackages or lua.withPackages
      # do not forget to set `hosts.python3.enable` in package settings

      # get the path to this python environment
      # in your lua config via
      # vim.g.python3_host_prog
      # or run from nvim terminal via :!<packagename>-python3
      python3.libraries = {
        test = (_: [ ]);
      };
      # populates $LUA_PATH and $LUA_CPATH
      extraLuaPackages = {
        general = [ (_: [ ]) ];
      };

      # see :help nixCats.flake.outputs.categoryDefinitions.default_values
      # this will enable test.default and debug.default
      # if any subcategory of test or debug is enabled
      # WARNING: use of categories argument in this set will cause infinite recursion
      # The categories argument of this function is the FINAL value.
      # You may use it in any of the other sets.
      extraCats = {
        test = [
          [
            "test"
            "default"
          ]
        ];
        debug = [
          [
            "debug"
            "default"
          ]
        ];
      };
    };

  # packageDefinitions:

  # Now build a package with specific categories from above
  # All categories you wish to include must be marked true,
  # but false may be omitted.
  # This entire set is also passed to nixCats for querying within the lua.
  # It is directly translated to a Lua table, and a get function is defined.
  # The get function is to prevent errors when querying subcategories.

  # see :help nixCats.flake.outputs.packageDefinitions
  packageDefinitions =
    let
      nvim =
        { pkgs, ... }@misc:
        {
          settings = {
            suffix-path = true;
            suffix-LD = true;
            aliases = [ ];
            wrapRc = true;
            configDirName = "nvim";
            hosts.python3.enable = true;
            hosts.node.enable = true;
          };
          categories = {
            markdown = true;
            statistics = true;
            zettelkasten = true;
            typst = true;
            general = true;
            lint = true;
            format = true;
            neonixdev = true;
            test = true;
            lspDebugMode = false;
            themer = true;
            colorscheme = "catppuccin";
          };
          extra = {
            nixdExtras = {
              nixpkgs = ''import ${pkgs.path} {}'';
            };
          };
        };
      nnvim =
        { pkgs, ... }@misc:
        let
          base = nvim misc;
        in
        base
        // {
          settings = base.settings // {
            wrapRc = false;
          };
        };
    in
    {
      inherit nvim nnvim;
    };

  defaultPackageName = "nvim";
  # I did not here, but you might want to create a package named nvim.

  # defaultPackageName is also passed to utils.mkNixosModules and utils.mkHomeModules
  # and it controls the name of the top level option set.
  # If you made a package named `nixCats` your default package as we did here,
  # the modules generated would be set at:
  # config.nixCats = {
  #   enable = true;
  #   packageNames = [ "nixCats" ]; # <- the packages you want installed
  #   <see :h nixCats.module for options>
  # }
  # In addition, every package exports its own module via passthru, and is overrideable.
  # so you can yourpackage.homeModule and then the namespace would be that packages name.
in
# you shouldnt need to change much past here, but you can if you wish.
# but you should at least eventually try to figure out whats going on here!
# see :help nixCats.flake.outputs.exports
forEachSystem (
  system:
  let
    # and this will be our builder! it takes a name from our packageDefinitions as an argument, and builds an nvim.
    nixCatsBuilder = utils.baseBuilder luaPath {
      # we pass in the things to make a pkgs variable to build nvim with later
      inherit
        nixpkgs
        system
        dependencyOverlays
        extra_pkg_config
        ;
      # and also our categoryDefinitions and packageDefinitions
    } categoryDefinitions packageDefinitions;
    # call it with our defaultPackageName
    defaultPackage = nixCatsBuilder defaultPackageName;

    # this pkgs variable is just for using utils such as pkgs.mkShell
    # within this outputs set.
    pkgs = import nixpkgs { inherit system; };
    # The one used to build neovim is resolved inside the builder
    # and is passed to our categoryDefinitions and packageDefinitions
  in
  {
    # these outputs will be wrapped with ${system} by utils.eachSystem

    # this will generate a set of all the packages
    # in the packageDefinitions defined above
    # from the package we give it.
    # and additionally output the original as default.
    packages = utils.mkAllWithDefault defaultPackage;

    # choose your package for devShell
    # and add whatever else you want in it.
    devShells = {
      default = pkgs.mkShell {
        name = defaultPackageName;
        packages = [ defaultPackage ];
        inputsFrom = [ ];
        shellHook = '''';
      };
    };

  }
)
// (
  let
    # we also export a nixos module to allow reconfiguration from configuration.nix
    nixosModule = utils.mkNixosModules {
      moduleNamespace = [ defaultPackageName ];
      inherit
        defaultPackageName
        dependencyOverlays
        luaPath
        categoryDefinitions
        packageDefinitions
        extra_pkg_config
        nixpkgs
        ;
    };
    # and the same for home manager
    homeModule = utils.mkHomeModules {
      moduleNamespace = [ defaultPackageName ];
      inherit
        defaultPackageName
        dependencyOverlays
        luaPath
        categoryDefinitions
        packageDefinitions
        extra_pkg_config
        nixpkgs
        ;
    };
  in
  {

    # these outputs will be NOT wrapped with ${system}

    # this will make an overlay out of each of the packageDefinitions defined above
    # and set the default overlay to the one named here.
    overlays = utils.makeOverlays luaPath {
      inherit nixpkgs dependencyOverlays extra_pkg_config;
    } categoryDefinitions packageDefinitions defaultPackageName;

    nixosModules.default = nixosModule;
    homeModules.default = homeModule;

    inherit utils nixosModule homeModule;
    inherit (utils) templates;
  }
)
