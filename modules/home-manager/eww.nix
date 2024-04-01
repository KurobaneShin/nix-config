{pkgs, ...}: {
  programs.eww = {
    enable = true;
    configDir = ../../config/eww;
    package = pkgs.eww-wayland;
  };
}
