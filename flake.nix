{
  description = "Various personal Nix configs";

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
    sops-nix.url = "github:Mic92/sops-nix";

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
      };
    };
}
