{ config, inputs, lib, ...}:

{
  imports = [ inputs.nixcord.homeModules.nixcord ];
  
  programs.nixcord = {
    enable = true;
    config = {
      themeLinks = [
        "https://github.com/shvedes/discord-gruvbox/blob/main/gruvbox-dark.theme.css"
      ];
    };
  };
}
