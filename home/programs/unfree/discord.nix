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
    discord.openASAR.enable = true;
    config = {
      useQuickCss = false;
      frameless = true;
      enabledThemes = ["midnight-rose-pine.theme.css"];

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

    file.".config/Vencord/themes/midnight-rose-pine.theme.css".source =
      pkgs.fetchFromGitHub {
        owner = "refact0r";
        repo = "midnight-discord";
        rev = "6f727783935069c02b8a84985f3bd55a38982533";
        hash = "sha256-XoYfZdz07P6b7p7DZLiArFG4LNlDghrUK32uQtzvkjo=";
      }
      + "/themes/flavors/midnight-rose-pine.theme.css";
  };
}
