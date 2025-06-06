{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.flatpak.packages = [
    "com.usebottles.bottles"
  ];
}
