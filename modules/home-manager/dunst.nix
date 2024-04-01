{...}: {
  xdg.configFile."dunst" = {
    source = ../../config/dunst;
    recursive = true;
  };
}
