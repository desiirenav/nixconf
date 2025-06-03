{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nixcord.homeModules.nixcord];

  programs.nixcord = {
    enable = true; # enable Nixcord. Also installs discord package
    quickCss = "https://refact0r.github.io/system24/build/system24.css"; # quickCSS file
    config = {
      useQuickCss = true; # use out quickCSS
      themeLinks = [
      ];
      frameless = true; # set some Vencord options
    };
  };
  # ...
}
