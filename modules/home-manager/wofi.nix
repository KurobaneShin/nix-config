{...}: {
  programs.wofi = {
    enable = true;
  };

  home.file.".config/wofi/style.css".source = ../../config/wofi/wofi.css;
}
