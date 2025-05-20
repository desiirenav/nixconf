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
        gaps = 16;
      };
    };
  };
}
