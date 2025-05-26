{
  pkgs,
  config,
  lib,
}: {
  fonts.packages = with pkgs; [
    lmodern
  ];
}
