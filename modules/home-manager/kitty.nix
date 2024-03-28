{...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    environment = {
      KITTY_DISABLE_WAYLAND = "1";
    };
    font = {
      name = "FiraCode Nerd Font";
    };
  };
}
