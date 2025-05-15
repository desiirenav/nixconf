{
  nixpkgs,
  astal,
  system,
  ags,
  ...
}: let
  pkgs = nixpkgs.legacyPackages.${system};
  astalpkgs = astal.packages.${system};
in {
  packages.${system}.default = pkgs.stdenvNoCC.mkDerivation rec {
    name = "my-shell";
    src = ./.;

    nativeBuildInputs = [
      ags.packages.${system}.default
      pkgs.wrapGAppsHook
      pkgs.gobject-introspection
    ];

    buildInputs = with astalpkgs; [
      astal3
      io
    ];

    installPhase = ''
      mkdir -p $out/bin
      ags bundle app.ts $out/bin/"$${name}"
    '';
  };
}
