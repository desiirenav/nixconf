{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    autoEnable = true;
    enable = true;
    image = ./statue.png;
    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
      size = 24;
    };
    base16Scheme = {
      base00 = "1d2021";
      base01 = "3c3836";
      base02 = "504945";
      base03 = "665c54";
      base04 = "bdae93";
      base05 = "d5c4a1";
      base06 = "ebdbb2";
      base07 = "fbf1c7";
      base08 = "fb4934";
      base09 = "fe8019";
      base0A = "fabd2f";
      base0B = "b8bb26";
      base0C = "8ec07c";
      base0D = "83a598";
      base0E = "d3869b";
      base0F = "d65d0e";
    };
    fonts = {
      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };
      sansSerif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };
      monospace = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-mono-nerd;
        name = "SF Mono Nerd Font";
      };
    };
  };
}
