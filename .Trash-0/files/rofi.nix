{
  pkgs,
  config,
  stylix,
  ...
}: {
  home.packages = with pkgs; [rofi-wayland];
}
