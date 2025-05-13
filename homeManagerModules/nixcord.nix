{
  config,
  pkgs,
  inputs,
  ...
}: {
  # ...
  programs.nixcord = {
    enable = true; # enable Nixcord. Also installs discord package
    quickCss = "some CSS"; # quickCSS file
    config = {
      useQuickCss = true; # use out quickCSS
      themeLinks = [
        # or use an online theme`
        "https://github.com/refact0r/system24/blob/main/theme/system24.theme.css"
      ];
      frameless = true; # set some Vencord options
    };
  };
  # ...
}
