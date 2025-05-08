{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    openASAR.enable = false;
    quickCss = ''
      body {
       		--font: 'AurulentSansM Nerd Font Mono';
       		--font-display: 'AurulentSansM Nerd Font Mono';
       		--font-code: 'AurulentSansM Nerd Font Mono';
      }
    '';
    config = {
      useQuickCss = true;
      frameless = true;
      enabledThemes = ["system24-rose-pine.theme.css"];

      plugins = {
        alwaysExpandRoles.enable = true;

        betterFolders = {
          enable = true;

          closeAllHomeButton = true;
          forceOpen = true;
        };

        betterGifPicker.enable = true;
        betterRoleDot.enable = true;
        betterSettings.enable = true;
        clearURLs.enable = true;
        colorSighted.enable = true;
        favoriteEmojiFirst.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        gameActivityToggle.enable = true;
        iLoveSpam.enable = true;
        imageZoom.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;

        messageLogger = {
          enable = true;

          ignoreBots = true;
          ignoreSelf = true;
        };

        moreCommands.enable = true;
        mutualGroupDMs.enable = true;
        newGuildSettings = {
          enable = true;
          guild = false;
          everyone = false;
          messages = "only@Mentions";
        };

        noF1.enable = true;
        noOnboardingDelay.enable = true;
        noReplyMention.enable = true;
        noSystemBadge.enable = true;
        noTypingAnimation.enable = true;
        previewMessage.enable = true;
        relationshipNotifier.enable = true;
        reverseImageSearch.enable = true;

        roleColorEverywhere = {
          enable = true;
          memberList = false;
        };

        serverInfo.enable = true;
        typingIndicator.enable = true;
        voiceChatDoubleClick.enable = true;
        viewIcons.enable = true;
        volumeBooster.enable = true;
      };
    };
  };

  home = {
    persistence."/persist/home/${config.home.username}".directories = [
      ".config/discord"
    ];

    file.".config/Vencord/themes/system24-rose-pine.theme.css".source =
      pkgs.fetchFromGitHub {
        owner = "refact0r";
        repo = "system24";
        rev = "2e662212b48d29d9e70a5304d66e8ffbc8ca4b0d";
        hash = "sha256-UpGHyPL+uPZi/G6uy/Vua3b1k2nxTs1HnMUnohGsgaw=";
      }
      + "/theme/flavors/system24-rose-pine.theme.css";
  };
}
