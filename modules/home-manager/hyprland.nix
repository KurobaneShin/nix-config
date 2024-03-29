{
  pkgs,
  config,
  lib,
  ...
}: let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img ${../../config/hypr/wallpaper.png}
  '';
in {
  wayland.windowManager.hyprland = {
    enable = true;
  };

  xdg.configFile."hypr" = {
    source = ../../config/hypr;
    recursive = true;
  };
}
