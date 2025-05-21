{
  pkgs,
  lib,
  ...
}: {
  stylix = {
    autoEnable = true;
    enable = true;
    targets = {
      waybar.enable = false;
    };
  };
}
