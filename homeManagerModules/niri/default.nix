{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    ./binds.nix
    ./rules.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite
    fuzzel
  ];
  programs.niri = {
    enable = true;
    settings = {
      environment = {
        DISPLAY = ":12";
      };
      spawn-at-startup = [
        {
          command = [
            "${lib.getExe pkgs.xwayland-satellite}"
            config.programs.niri.settings.environment.DISPLAY
          ];
        }
      ];
    };
  };
}
