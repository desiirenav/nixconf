{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  programs.niri = {
    enable = true;
    settings = {
      environment = {
        DISPLAY = ":0";
        NIXOS_OZONE_WL = "1";
      };
      layout = {
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 2;
        };
        shadow = {
          enable = true;
        };
        gaps = 6;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
      spawn-at-startup = [
        {
          command = [
            "xwayland-satellite"
          ];
        }
      ];
    };
  };
}
