{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ghostty.packages.${pkgs.system}.default];

  programs.ghostty.enable = true;
}
