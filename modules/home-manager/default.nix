# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  imports = [
    ./zsh.nix
    ./starship.nix
    ./nvim.nix
    ./kitty.nix
    ./firefox.nix
    ./hyprland.nix
    ./wofi.nix
    ./waybar.nix
    ./dunst.nix
  ];
}
