{
  description = "My Nix setup";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:kaylorben/nixcord";
    ghostty.url = "github:ghostty-org/ghostty";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    nvf.url = "github:notashelf/nvf";
  };
  outputs = {
    self,
    nixpkgs,
    stylix,
    nvf,
    astal,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixos/config.nix
        (import ./nixosModules/disko.nix {device = "/dev/nvme0n1";})
        inputs.disko.nixosModules.default
        inputs.impermanence.nixosModules.impermanence
        inputs.home-manager.nixosModules.default
      ];
    };
    packages.${system}.astal-bar = astal.lib.mkLuaPackage {
      inherit pkgs;
      name = "astal-bar"; # Executable name
      src = ./astal-bar; # Directory with your init.lua

      extraPackages = [
        astal.packages.${system}.battery
        pkgs.dart-sass
      ];
    };
  };
}
