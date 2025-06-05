{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    (import ./../modules/nixos/disko.nix {device = "/dev/nvme0n1";})
    ./hardware.nix
    ./../modules/nixos/nvidia.nix
    ./../modules/nixos/stylix.nix
    ./../modules/nixos/nvf.nix
    ./../modules/nixos/imper.nix
    ./../modules/nixos/gaming.nix
    ./../modules/nixos/fonts.nix
    ./../overlays/liga.nix
  ];

  nixpkgs.overlays = [inputs.niri.overlays.niri];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NTFS
  boot.supportedFilesystems = ["ntfs"];

  networking.hostName = "nixos";

  # Networking
  networking.networkmanager.enable = true;

  # Time zone.
  time.timeZone = "America/Toronto";

  # Internationalisation
  i18n.defaultLocale = "en_CA.UTF-8";

  # Configure keymap in X11
  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # User
  users.users.narayan = {
    isNormalUser = true;
    description = "Narayan";
    hashedPasswordFile = "/persist/passwords/narayan";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.nushell;
    openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIId7MUXGg4c/ez6IoOguGAvkP5HdhHhcCp2fXsSIYUqy narayan@nixos"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Niri
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    zathura
    typst
    yazi
    fastfetch
    unzip
    unrar
    pfetch
    nitch
    ani-cli
    librewolf
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "narayan" = import ./../home-manager/home.nix;
    };
  };

  # OpenSSH daemon.
  services.openssh.enable = true;

  # Autoclean
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "25.05";
}
