{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [inputs.ghostty.packages.x86_64-linux.default];

  xdg.configFile."ghostty/config".text = ''
    theme = GruvboxDarkHard
  '';
}
