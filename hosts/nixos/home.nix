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
    ./../../homeManagerModules/launcher.nix
    ./../../homeManagerModules/kitty.nix
    ./../../homeManagerModules/shell.nix
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
      ".local/share/keyrings"
      ".local/share/direnv"
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
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
