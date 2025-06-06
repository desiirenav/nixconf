{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.flatpak.enable = true;

  services.flatpak.remotes = [
    {
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }
  ];

  services.flatpak.packages = [
    {
      appId = "com.usebottles.bottles";
      origin = "flathub";
    }
  ];
}
