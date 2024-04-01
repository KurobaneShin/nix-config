{...}: {
  xdg.configFile."neofetch" = {
    source = ../../config/neofetch;
    recursive = true;
  };
}
