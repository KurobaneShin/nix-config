{...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "FiraCode Nerd Font";
    };
  };
}
