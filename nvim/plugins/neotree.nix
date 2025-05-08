{...}: {
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;

    window.width = 30;

    filesystem.filteredItems = {
      hideGitignored = false;
      hideDotfiles = false;
      neverShow = [".git"];
    };
  };
}
