{ inputs, pkgs, config, lib,  ... }:
/* let
  hasOptinPersistence = config.environment.persistence ? "/persist";
in */
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];
  home.packages = with pkgs; [ sops ];

  sops = {
    defaultSopsFile = ../../secrets/accounts.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets.rsa_id = {
      sopsFile = ../../secrets/ssh-keys.yaml;
      path = "${config.home.homeDirectory}/.ssh/id_rsa";
    };

    secrets.rsa_id_pub = {
      sopsFile = ../../secrets/ssh-keys.yaml;
      path = "${config.home.homeDirectory}/.ssh/id_rsa.pub";
    };
  };
}
