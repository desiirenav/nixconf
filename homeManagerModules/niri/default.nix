{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix
    ./binds.nix
    ./rules.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite
    fuzzel
    brightnessctl
    dunst
    noto-fonts-cjk-sans
    font-awesome
    noto-fonts
  ];

  programs.waybar.enable = true;

  programs.niri = {
    enable = true;
    settings = {
      environment = {
        DISPLAY = ":0";
        NIXOS_OZONE_WL = "1";
      };
      spawn-at-startup = [
        {
          command = [
            "xwayland-satellite"
          ];
        }
        {
          command = [
            "waybar"
          ];
        }
      ];
    };
  };
}
