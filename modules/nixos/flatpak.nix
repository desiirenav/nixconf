{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.flatpak.enable = true;

  services.flatpak.packages = [
    {
      appId = "com.usebottles.bottles";
      origin = "flathub";
    }
  ];
}
