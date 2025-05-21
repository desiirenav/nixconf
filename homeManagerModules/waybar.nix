{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  programs.waybar = lib.mkForce {
    enable = true;
    style = builtins.readFile ./style.css;
  };
}
