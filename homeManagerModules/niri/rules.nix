{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  programs.niri.settings = {
    window-rules = [
      {
        geometry-corner-radius = {
          bottom-left = 4.0;
          bottom-right = 4.0;
          top-left = 4.0;
          top-right = 4.0;
        };
        clip-to-geometry = true;
      }
    ];
  };
}
