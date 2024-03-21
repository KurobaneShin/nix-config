{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    # syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      update-home = "cd ~/Documents/nix-config/ && home-manager switch --flake .#kurobane@nixos";
      update-system = "cd ~/Documents/nix-config/ && sudo nixos-rebuild switch --flake .#nixos";
    };
  };
}
