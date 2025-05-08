{
  inputs,
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [
      (inputs.prismlauncher.packages.${pkgs.system}.prismlauncher)
    ];
    persistence."/persist/home/${config.home.username}".directories = [
      ".local/share/PrismLauncher"
    ];
  };
}
