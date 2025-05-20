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
    decoration = {
      gradient = {
      };
    };
    settings = {
      animation = {
      };
      layout = {
        border = {
        };
        focus-ring = {
        };
        shadow = {
        };
        insert-hint = {
        };
      };
    };
  };
}
