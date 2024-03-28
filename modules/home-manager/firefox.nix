{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.kurobane = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        sponsorblock
        darkreader
        tridactyl
        youtube-shorts-block
      ];
    };
  };
}
