{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  programs.waybar = lib.mkForce {
    enable = true;
  };
}
