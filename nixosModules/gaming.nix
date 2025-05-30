{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mangohud
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [proton-ge-bin];
  };

  programs.gamemode.enable = true;
}
