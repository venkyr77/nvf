{lib, ...}: let
  inherit (lib.nvim.types) mkPluginSetupOption;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) listOf str;
in {
  options.vim.ui.dressing = {
    enable = mkEnableOption "auto-save";
    setupOpts = mkPluginSetupOption "dressing" {
      select = {
        backend = mkOption {
          type = listOf str;
          default = ["fzf_lua"];
          description = "Priority list of preferred vim.select implementations";
        };
      };
    };
  };
}
