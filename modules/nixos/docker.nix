{
  config,
  lib,
  modulesPath,
  pkgs,
  options,
  specialArgs,
  ...
}: {
  users.extraGroups.docker.members = ["kurobane"];
  virtualisation.docker = {
    enable = true;
    autoPrune = {
      dates = "weekly";
      enable = true;
      flags = ["--all"];
    };
  };
}
