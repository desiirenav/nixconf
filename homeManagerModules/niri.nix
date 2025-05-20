{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.homeModules.niri];

  programs.niri = {
    enable = true;
    settings = {
      binds = with config.lib.niri.actions; {
        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
    "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";

        "Mod+X".action = spawn "rofi-wayland";
        "Mod+Return".action = spawn "kitty";
        "Mod+1".action = focus-workspace 1;
      };
    }
  };
}
