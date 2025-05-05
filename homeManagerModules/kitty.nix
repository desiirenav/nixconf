{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_windows_close = 0;
      enable_audio_bell = false;
      background_opacity = "0.5";
      background_blur = 0;
    };
  };
}
