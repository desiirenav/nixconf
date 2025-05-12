{
  pkgs,
  lib,
  ...
}: {
  stylix = {
    autoEnable = true;
    enable = true;
    targets = {
      vencord.enable = true;
      wezterm.enable = true;
    };
  };
}
