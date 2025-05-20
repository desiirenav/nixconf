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
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    hyprland.url = "github:hyprwm/Hyprland";
    nixcord.url = "github:kaylorben/nixcord";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    stylix,
    anyrun,
    nvf,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixos/config.nix
        (import ./nixosModules/disko.nix {device = "/dev/nvme0n1";})
        inputs.disko.nixosModules.default
        inputs.impermanence.nixosModules.impermanence
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
