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
    settings = builtins.fromTOML (builtins.readFile ./starship.toml);
  };
}
