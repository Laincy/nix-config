{pkgs, ...}: {
  lspsAndRuntimeDeps = {
    general = with pkgs; [
      ripgrep
      fd
    ];
  };

  startupPlugins = {
    general = with pkgs.vimPlugins; [
      rose-pine
    ];
  };

  # not loaded automatically at startup.
  # use with packadd and an autocommand in config to achieve lazy loading
  optionalPlugins = {
    general = with pkgs.vimPlugins; [];
  };

  # shared libraries to be added to LD_LIBRARY_PATH
  # variable available to nvim runtime
  sharedLibraries = {
    general = with pkgs; [];
  };

  # environmentVariables:
  # this section is for environmentVariables that should be available
  # at RUN TIME for plugins. Will be available to path within neovim terminal
  environmentVariables = {
    test = {
      CATTESTVAR = "It worked!";
    };
  };

  # If you know what these are, you can provide custom ones by category here.
  # If you dont, check this link out:
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
  extraWrapperArgs = {
    test = [
      ''--set CATTESTVAR2 "It worked again!"''
    ];
  };

  # lists of the functions you would have passed to
  # python.withPackages or lua.withPackages

  # get the path to this python environment
  # in your lua config via
  # vim.g.python3_host_prog
  # or run from nvim terminal via :!<packagename>-python3
  # do not forget to set `hosts.python3.enable` in package settings
  python3.libraries = {
    test = _: [];
  };
  # populates $LUA_PATH and $LUA_CPATH
  extraLuaPackages = {
    test = [(_: [])];
  };
}
