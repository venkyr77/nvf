{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.vim.ui.dressing;
in {
  vim = {
    fzf-lua.enable = true;
    lazy.plugins."dressing.nvim" = mkIf cfg.enable {
      package = pkgs.vimPlugins.dressing-nvim;
      setupModule = "dressing";
      inherit (cfg) setupOpts;
    };
  };
}
