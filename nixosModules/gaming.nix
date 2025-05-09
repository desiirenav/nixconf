{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    heroic
    mangohud
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [proton-ge-bin];
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;
}
