{
  description = "Various personal Nix configs";

  nixConfig = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    # Critical OS level dependencies
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    lanzaboote.url = "github:nix-community/lanzaboote";
    impermanence.url = "github:nix-community/impermanence";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Use lelvel dependencies
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/hyprland";
    hyprpanel.url = "github:Jas-SinghFSU/hyprpanel";

    firefox-addons = {
      # Only using this URL because my school blocks Gitlab
      # TODO: Change back to GitLab once I graduate highschool
      url = "github:nix-community/nur-combined?dir=repos/rycee/pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      formatter = pkgs.alejandra;

      packages.nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = ./nvim;
      };
    })
    // {
      nixosConfigurations = let
        inherit (nixpkgs.lib) nixosSystem;
      in {
        # Lenovo Laptop
        verum = nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs self;};
          modules = [
            ./nixos/verum
          ];
        };

        # Oracle Ampere Server
        axiom = nixosSystem {
          system = "aarch64-linux";
          specialArgs = {inherit inputs self;};
          modules = [
            ./nixos/axiom
          ];
        };
      };
    };
}
