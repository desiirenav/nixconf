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
            "${pkgs.swww}/bin/swww-daemon"
          ];
        }
        {
          command = [
            "${pkgs.swww}/bin/swww"
            "img"
            "./../bird.png"
          ];
        }
      ];
    };
  };
}
