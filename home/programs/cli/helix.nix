{pkgs, ...}: {
  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      nixd
      rust-analyzer
      zls
      lua-language-server
      taplo-lsp
      marksman
    ];

    package = pkgs.evil-helix;

    settings = {
      theme = "rose_pine";

      editor = {
        line-number = "relative";

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        end-of-line-diagnostics = "hint";

        inline-diagnostics.cursor-line = "warning";
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };

        indent-guides = {
          render = false;
          characetr = "▏";
          skip_levels = 1;
        };
      };

      keys.normal = {
        "C-n" = "file_picker";
      };
    };
  };
}
