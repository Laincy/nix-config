{
  description = "Laincy's NixOs Config";

  inputs = {
    # Essential dependencies, do not touch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    impermanence.url = "github:nix-community/impermanence";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Important to the rice and general utility, not critical
    nixvim.url = "github:nix-community/nixvim";

    stylix.url = "github:danth/stylix";
    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    formatter = system: nixpkgs.legacyPackages.${system}.alejandra;
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        # Lenovo Ideapad Pro 5i - Main Desktop
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos
          inputs.stylix.nixosModules.stylix
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
        ];
      };
    };
  };
}
