{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  environment.systemPackages = with pkgs; [sops];

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/persist/var/keys/agekey.txt";

    secrets = {
      primary.neededForUsers = true;

      github-key = {
        owner = "laincy";
      };
    };
  };
}
