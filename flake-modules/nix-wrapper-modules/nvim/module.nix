inputs:
{
  config,
  wlib,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    wlib.wrapperModules.neovim
    (inputs.nixpkgs.lib.modules.importApply ./setup.nix inputs)
  ];
  options = {
    settings = {
      colorscheme = lib.mkOption {
        type = lib.types.str;
        default = "catppuccin-mocha";
      };
      wrap = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Whether to wrap neovim";
      };
    };
  };

  config = {
    settings.config_directory =
      if config.settings.wrap then ./. else lib.generators.mkLuaInline "vim.fn.stdpath('config')";

    # If you want to install multiple neovim derivations via home.packages or environment.systemPackages
    # in order to prevent path collisions:

    # set this to true:
    # settings.dont_link = true;

    # and make sure these dont share values:
    # binName = "nvim";
    # settings.aliases = [ ];

    # To add a wrapped $out/bin/${config.binName}-neovide to the resulting neovim derivation
    # hosts.neovide.nvim-host.enable = true;

    # `:lua require('lzextras').debug.display(require(vim.g.nix_info_plugin_name))`
    info = {
      nix = {
        nixpkgs = "import ${pkgs.path} {}";
        nixos_options = ''(builtins.getFlake "${builtins.toString inputs.self.outPath}").nixosConfigurations.desktop.options'';
        home_manager_options = ''(builtins.getFlake "${builtins.toString inputs.self.outPath}").homeConfigurations."yiheng@desktop".options'';
      };
    };
    specs = {
      colorscheme = {
        lazy = true;
        data = builtins.getAttr config.settings.colorscheme (
          with pkgs.vimPlugins;
          {
            "catppuccin-nvim" = catppuccin-nvim;
            "catppuccin-latte" = catppuccin-nvim;
            "catppuccin-frappe" = catppuccin-nvim;
            "catppuccin-macchiato" = catppuccin-nvim;
            "catppuccin-mocha" = catppuccin-nvim;
          }
        );
      };
      lze = {
        data = with pkgs.vimPlugins; [
          lze
          lzextras
        ];
      };
      general = {
        after = [ "lze" ];
        runtimePkgs = with pkgs; [
          fd
          ripgrep
          tree-sitter
          universal-ctags
          zoxide
        ];
        lazy = true;
        data =
          with pkgs.vimPlugins;
          lib.lists.flatten [
            # lualine-lsp-progress
            (lib.map
              (plugin: {
                lazy = false;
                data = plugin;
              })
              [
                vim-repeat
                plenary-nvim
                nvim-notify
                vim-tmux-navigator
                oil-nvim
                nvim-web-devicons
              ]
            )
            aerial-nvim
            barbar-nvim
            comment-nvim
            diffview-nvim
            fidget-nvim
            flash-nvim
            gitsigns-nvim
            hardtime-nvim
            indent-blankline-nvim
            lualine-nvim
            neogit
            nui-nvim
            nvim-autopairs
            nvim-spectre
            nvim-surround
            persistence-nvim
            undotree
            vim-rhubarb
            vim-sleuth
            vim-startuptime
            which-key-nvim
          ];
      };
      lsp = {
        lazy = true;
        data = with pkgs.vimPlugins; [
          nvim-lspconfig
        ];
      };
      telescope = {
        lazy = true;
        data = with pkgs.vimPlugins; [
          telescope-fzf-native-nvim
          telescope-ui-select-nvim
          telescope-file-browser-nvim
          telescope-zoxide
          telescope-nvim
        ];
      };
      treesitter = {
        lazy = true;
        data = with pkgs.vimPlugins; [
          nvim-treesitter-textobjects
          (nvim-treesitter.withPlugins (
            plugins: with plugins; [
              bash
              bibtex
              caddy
              cmake
              commonlisp
              cpp
              css
              csv
              desktop
              editorconfig
              fish
              git_config
              git_rebase
              gitattributes
              gitcommit
              gitignore
              glsl
              gpg
              hjson
              hlsl
              html
              ini
              java
              javascript
              jq
              json
              json5
              just
              latex
              lua
              make
              markdown
              mermaid
              nix
              python
              qmljs
              regex
              rust
              scheme
              ssh_config
              toml
              typescript
              typst
              xml
              xresources
              yaml
            ]
          ))
        ];
      };
      completion = {
        lazy = true;
        data = with pkgs.vimPlugins; [
          luasnip
          config.nvim-lib.neovimPlugins.luasnip-latex-snippets-nvim
          friendly-snippets
          cmp-cmdline
          blink-cmp
          blink-compat
          colorful-menu-nvim
        ];
      };
      lint = {
        lazy = true;
        data = pkgs.vimPlugins.nvim-lint;
      };
      format = {
        lazy = true;
        data = pkgs.vimPlugins.conform-nvim;
      };
      latex = {
        lazy = true;
        data = pkgs.vimPlugins.vimtex;
      };
      markdown = {
        lazy = true;
        data = with pkgs.vimPlugins; [
          markdown-preview-nvim
          render-markdown-nvim
        ];
      };
      org-mode = {
        lazy = true;
        data = pkgs.vimPlugins.orgmode;
      };
      quarto = {
        lazy = true;
        data = with pkgs.vimPlugins; [
          otter-nvim
          quarto-nvim
        ];
      };
      rust = {
        lazy = true;
        data = pkgs.vimPlugins.rustaceanvim;
      };
      typst = {
        lazy = true;
        data = pkgs.vimPlugins.typst-preview-nvim;
      };
      obsidian = {
        lazy = true;
        data = pkgs.vimPlugins.obsidian-nvim;
      };
      debug = {
        lazy = true;
        data = with pkgs.vimPlugins; [
          nvim-dap
          nvim-dap-ui
          nvim-dap-virtual-text
        ];
      };
      lua = {
        after = [ "general" ];
        lazy = true;
        data = with pkgs.vimPlugins; [
          lazydev-nvim
        ];
      };
      nix = {
        data = null;
        runtimePkgs = with pkgs; [
          nixd
          nixfmt
        ];
      };
    };
  };
}
