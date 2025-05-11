{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.nixcord.homeModules.nixcord];

  programs.nixcord = {
    enable = true;
    config = {
      themeLinks = [
        "https://github.com/refact0r/system24/blob/main/theme/system24.theme.css"
      ];
    };
  };
}
