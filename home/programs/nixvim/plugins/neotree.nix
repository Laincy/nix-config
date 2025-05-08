{
  enable = true;
  closeIfLastWindow = true;

  window = {
    width = 30;
  };

  filesystem.filteredItems = {
    hideGitignored = false;
    alwaysShow = [
      ".gitignore"
      ".env"
    ];
  };
}
