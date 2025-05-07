{
  description = "My Nix setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixcord.url = "github:kaylorben/nixcord";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    hyprland.url = "github:hyprwm/Hyprland";
    nvf.url = "github:notashelf/nvf";
    textfox.url = "github:adriankarlen/textfox";
  };

  outputs = {
    self,
    nixpkgs,
    stylix,
    anyrun,
    nvf,
    astal,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    astalpkgs = astal.packages.${system};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixos/config.nix
        (import ./nixosModules/disko.nix {device = "/dev/nvme0n1";})
        inputs.disko.nixosModules.default
        inputs.impermanence.nixosModules.impermanence
        inputs.home-manager.nixosModules.default
      ];
    };

    packages.${system}.default = astal.lib.mkLuaPackage {
      inherit pkgs;
      name = "astal";
      src = ./astal;

      extraLuaPackages = ps:
        with ps; [
          http
          dkjson
        ];

      extraPackages = with astalpkgs; [
        battery
        astal4
        mpris
        apps
        astal3
        astal4
        battery
        bluetooth
        cava
        greet
        hyprland
        io
        mpris
        network
        notifd
        powerprofiles
        tray
        wireplumber
        pkgs.dart-sass
      ];
    };
  };
}
