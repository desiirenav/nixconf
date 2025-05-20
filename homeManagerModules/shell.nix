{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nushell = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };
}
