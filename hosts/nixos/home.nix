{
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./../../homeManagerModules/niri/default.nix
    ./../../homeManagerModules/stylix.nix
    ./../../homeManagerModules/shell.nix
    ./../../homeManagerModules/ghostty.nix
    ./../../homeManagerModules/quickshell/default.nix
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
      ".ssh"
      ".zen"
      ".config/nushell"
      ".config/quickshell"
      ".config/discord"
      ".config/Vencord"
      ".config/vesktop"
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
