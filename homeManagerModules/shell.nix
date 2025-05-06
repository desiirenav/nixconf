{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config.show_banner = false
    '';
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;

    settings = {
      right_format = "$cmd_duration";

      directory = {
        format = "[ ](bold)[ $path ]($style)";
        style = "bold";
      };

      character = {
        success_symbol = "[ ](bold)[ ➜](bold)";
        error_symbol = "[ ](bold)[ ➜](bold)";
      };

      cmd_duration = {
        min_time = 10;
        format = "[]($style)[[󰔚 ]()$duration]()[ ]($style)";
        disabled = false;
        style = "";
      };

      directory.substitutions = {
        "~" = "󰋞";
        "Documents" = " ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };
    };
  };
}
