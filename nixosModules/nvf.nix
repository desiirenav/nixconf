{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nvf.nixosModules.default];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        lsp.enable = true;
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          nix.enable = true;
          ts = {
            enable = true;
            treesitter.enable = true;
          };
          typst = {
            enable = true;
            extensions.typst-preview-nvim.enable = true;
          };
        };
      };
    };
  };
}
