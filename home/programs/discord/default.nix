{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
  ];

	
	home.file.".config/vesktop/settings/settings.json".source = ./settings.json;
}
