{
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./../../homeManagerModules/hypr/hyprland.nix
    ./../../homeManagerModules/stylix.nix
    ./../../homeManagerModules/kitty.nix
    ./../../homeManagerModules/shell.nix
    ./../../homeManagerModules/rofi.nix
    #./../../homeManagerModules/nixcord.nix
  ];

  home.username = "narayan";
  home.homeDirectory = "/home/narayan";

  home.stateVersion = "25.05";

  home.packages = [
  ];

  home.persistence."/persist/home/narayan" = {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Games"
      ".gnupg"
      ".ssh"
      ".nixops"
      ".config/heroic"
      ".config/nushell"
      #".config/discord"
      #".config/Vencord"
      ".local/share/keyrings"
      ".local/share/direnv"
      ".local/share/Steam"
    ];
    files = [
      ".screenrc"
    ];
    allowOther = true;
  };

  programs.git = {
    enable = true;
    userName = "desiirenav";
    userEmail = "desiirenav@hotmail.com";
  };

  nixpkgs.config.allowUnfree = true;

  programs.nushell = {
    enable = true;
  };

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
