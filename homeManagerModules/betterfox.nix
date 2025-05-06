{inputs, ...}: {
  imports = [inputs.betterfox.homeManagerModules.betterfox];

  programs.librewolf = {
    enable = true;
    betterfox = {
      enable = true;
      version = "128.0";
      settings = {
        enable = true;
        enableAllSections = true;
      };
    };
  };
}
