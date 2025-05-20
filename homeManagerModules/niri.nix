{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [inputs.niri.homeModules.niri];

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

      binds = with config.lib.niri.actions; {
        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";

        "Mod+X".action = spawn "fuzzel";
        "Mod+Return".action = spawn "kitty";
        "Mod+1".action = focus-workspace 1;
      };
    };
  };
}
