{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.xremap-flake.nixosModules.default];

  services.xremap = {
    withHypr = true;
    userName = "narayan";
    config = {
      keymap = [
        {
          name = "Left";
          remap = {
            "KEY_RIGHTALT" = "KEY_LEFT";
          };
        }

        {
          name = "Up";
          remap = {
            "KEY_SLASH" = "KEY_UP";
          };
        }

        {
          name = "Down";
          remap = {
            "KEY_RIGHTCTRL" = "KEY_DOWN";
          };
        }

        {
          name = "Right Arrow";
          remap = {
            "KEY_MENU" = "KEY_RIGHT";
          };
        }
      ];
    };
  };
}
