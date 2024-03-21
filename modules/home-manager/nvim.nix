{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim" = {
    source = ../../config/nvim;
    recursive = true;
  };

  programs.neovim.extraPackages = with pkgs; [
    shfmt
    ripgrep
    unzip

    # Used for treesitter
    gcc

    # Lua
    lua-language-server
    stylua
    selene

    # Python
    python311Packages.python-lsp-server

    # Javascript
    nodePackages.typescript-language-server
    # prettierd

    # Rust
    # rust-analyzer

    # nix
    nil
    alejandra
  ];

  home.packages = with pkgs; [
    (writeShellScriptBin "clean-nvim" ''
      rm -rf ${config.xdg.dataHome}/nvim
      rm -rf ${config.xdg.stateHome}/nvim
      rm -rf ${config.xdg.cacheHome}/nvim
    '')
    (writeShellScriptBin "clean-nvim-full" ''
      rm -rf ${config.xdg.dataHome}/nvim
      rm -rf ${config.xdg.stateHome}/nvim
      rm -rf ${config.xdg.cacheHome}/nvim
      rm -rf ${config.xdg.configHome}/nvim
    '')
  ];
}
