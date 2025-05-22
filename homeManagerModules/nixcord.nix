{
  config,
  pkgs,
  inputs,
}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];
  programs.nixcord = {
    enable = true;
    quickCss = "some CSS"; # quickCSS file
    config = {
      useQuickCss = true; # use out quickCSS
      themeLinks = [
        "https://github.com/refact0r/system24/blob/main/theme/system24.theme.css"
      ];
      frameless = true;
      plugins = {
        hideAttachments.enable = true; # Enable a Vencord plugin
        ignoreActivities = {
          # Enable a plugin and set some options
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
          ignoredActivities = ["someActivity"];
        };
      };
    };
    extraConfig = {
    };
  };
}
