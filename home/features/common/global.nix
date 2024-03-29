# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ lib, config, outputs, ... }:

{
  imports = [
    ../nix.nix
    ../zsh.nix
    ../tmux.nix
    ../fonts.nix
    ../nvim.nix
    ../git.nix
    ../udiskie.nix
    ../cli-packages.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = lib.mkDefault "haru02w";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # let home-manager manage itself
  programs.home-manager.enable = true;
}
