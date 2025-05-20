{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  programs.niri = {
    settings = {
      layout = {
        gaps = 4;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
        border.width = 4;
        always-center-single-column = true;
        empty-workspace-above-first = true;
        focus-ring = {
          active.color = lib.mkForce "rgba(${config.stylix.base16Scheme.base0C}ff)";
          inactive.color = lib.mkForce "rgba(${config.stylix.base16Scheme.base00}ff)";
        };
      };
      window-rules = [
        {
          geometry-corner-radius = let
            radius = 4.0;
          in {
            bottom-left = radius;
            bottom-right = radius;
            top-left = radius;
            top-right = radius;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }
        {
          matches = [
            {is-floating = true;}
          ];
          shadow.enable = true;
        }
      ];
    };
  };
}
