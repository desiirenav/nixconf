{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  wallpaper = "${./../bird.png}";
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.niri = {
    enable = true;
    settings = {
      screenshot-path = "~/Pictures/Screenshots/%Y-%m-%dT%H:%M:%S.png";
      environment = {
        DISPLAY = ":0";
        NIXOS_OZONE_WL = "1";
      };
      prefer-no-csd = true;
      layout = {
        gaps = 8;
        focus-ring.enable = false;
        border = {
          enable = true;
          active.gradient = {
            from = colors.base07;
            to = colors.base08;
          };
          width = 3;
        };
        shadow = {
          enable = true;
        };
      };
      spawn-at-startup = [
        {
          command = ["xwayland-satellite"];
        }
        {
          command = ["swaybg" "-m" "fill" "-i" wallpaper];
        }
      ];
    };
  };
}
