{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  wallpaper = "${./bird.png}";
in {
  programs.niri = {
    enable = true;
    settings = {
      environment = {
        DISPLAY = ":0";
        NIXOS_OZONE_WL = "1";
      };
      prefer-no-csd = true;
      layout = {
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 2;
        };
        shadow = {
          enable = true;
        };
        gaps = 8;
      };
      spawn-at-startup = [
        {
          command = [
            "xwayland-satellite"
          ];
        }
        {
          command = [
            "swaybg"
            "-m"
            "fill"
            "i"
            wallpaper
          ];
        }
      ];
    };
  };
}
