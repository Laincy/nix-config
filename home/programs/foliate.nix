{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      foliate
    ];

    persistence."/persist/home/${config.home.username}".directories = [
			"Books"
			".local/share/com.github.johnfactotum.Foliate"
    ];
  };
}
