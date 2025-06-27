{
  description = "Laincy's personal NixOS configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    lanzaboote.url = "github:nix-community/lanzaboote";
    impermanence.url = "github:nix-community/impermanence";
    sops-nix.url = "github:Mic92/sops-nix";

    nixCats.url = "github:BirdeeHub/nixCats-nvim";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland";
    hyprpanel.url = "github:Jas-SinghFSU/hyprpanel";

    nixcord.url = "github:kaylorben/nixcord";

    firefox-addons = {
      # Only using this URL because my school blocks Gitlab
      # TODO: Change back to GitLab once I graduate highschool
      url = "github:nix-community/nur-combined?dir=repos/rycee/pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wgsl-analyzer.url = "github:wgsl-analyzer/wgsl-analyzer?ref=v0.9.8";
  };

  outputs = {
    self,
    nixpkgs,
    nixCats,
    ...
  } @ inputs: let
    forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.all;
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs self;};
      modules = [
        inputs.sops-nix.nixosModules.sops
        ./nixos
      ];
    };

    packages = forAllSystems (system: let
      luaPath = "${./nvim}";
      pkgs = import nixpkgs {inherit system;};
      categoryDefinitions = {pkgs, ...}: {
        lspsAndRuntimeDeps = {
          general = with pkgs; [
            ripgrep
            fd
            commitlint-rs
          ];

          lua = with pkgs; [
            lua-language-server
            stylua
          ];

          nix = with pkgs; [
            nixd
            alejandra
          ];

          markdown = with pkgs; [
            markdownlint-cli
          ];

          zig = with pkgs; [
            zls
            zig
          ];

          rust = with pkgs; [
            clippy
            inputs.wgsl-analyzer.packages.${system}.default
            rust-analyzer
            cargo
          ];
        };

        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lze
            lzextras
            plenary-nvim
            nvim-web-devicons

            rose-pine
          ];
        };

        optionalPlugins = {
          general = {
            # Essential plugins, dependencies
            core = with pkgs.vimPlugins; [
              nvim-lspconfig
              nvim-treesitter.withAllGrammars
              indent-blankline-nvim-lua
              trouble-nvim
            ];

            # Plugins for managing codestyle
            style = with pkgs.vimPlugins; [
              conform-nvim
              nvim-lint
            ];

            # Extra utility plugins
            extra = with pkgs.vimPlugins; [
              telescope-nvim
              neo-tree-nvim
              lualine-nvim
              lualine-lsp-progress
            ];
          };

          cmp = with pkgs.vimPlugins; [
            luasnip
            blink-cmp
            cmp-cmdline
            blink-compat
          ];

          markdown = with pkgs.vimPlugins; [
            markview-nvim
          ];
        };
      };

      packageDefinitions = {
        nvim = {pkgs, ...}: {
          # they contain a settings set defined above
          # see :help nixCats.flake.outputs.settings
          settings = {
            suffix-path = true;
            suffix-LD = true;
            wrapRc = true;
            # IMPORTANT:
            # your aliases may not conflict with your other packages.
            aliases = ["vim"];
            # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
          };
          # and a set of categories that you want
          categories = {
            general = true;
            lua = true;
            nix = true;
            cmp = true;
            markdown = true;
            zig = true;
            rust = true;
          };
          # anything else to pass and grab in lua with `nixCats.extra`
          extra = {
            wgsl-path = "${pkgs.wgsl-analyzer}";
            zig-path = "${pkgs.zig}/bin/zig";
            nixdExtras = {
              nixpkgs = ''import ${pkgs.path} {}'';
              nixos_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.nixos.options'';
              home_manager_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").homeConfigurations.nixos.options'';
            };
          };
        };
      };
      defaultPackageName = "nvim";

      nixCatsBuilder =
        nixCats.utils.baseBuilder luaPath {
          inherit nixpkgs system;
        }
        categoryDefinitions
        packageDefinitions;
      defaultPackage = nixCatsBuilder defaultPackageName;
    in
      nixCats.utils.mkAllWithDefault defaultPackage);
  };
}
