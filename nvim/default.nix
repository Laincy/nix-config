{
  pkgs,
  nixCats,
...
}: let
  utils = import nixCats;
  luaPath = ./.;

  categoryDefinitions = import ./category.nix;

  packageDefinitions = {
    nvim = import ./package.nix;
  };
  defaultPackageName = "nvim";
in
  utils.baseBuilder luaPath {inherit pkgs;} categoryDefinitions packageDefinitions defaultPackageName
