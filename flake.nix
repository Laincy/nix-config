{
  description = "Laincy's Dotfiles";

  inputs = {
    # Critical Dependencies
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:nix-community/nixvim";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Dependencies that are mostly for the rice. Not critical to operation
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/hyprland";
    hyprpanel.url = "github:Jas-SinghFSU/hyprpanel";

    firefox-addons = {
      url = "github:nix-community/nur-combined?dir=repos/rycee/pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in {
      formatter = pkgs.alejandra;

      packages.nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = import ./nvim;
      };
    })
    // {
      nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs self;};
        modules = [
          ./nixos
          inputs.stylix.nixosModules.stylix
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
        ];
      };
    };
}
