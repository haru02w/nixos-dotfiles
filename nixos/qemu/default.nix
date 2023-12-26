{ config, pkgs, inputs, outputs, ...}:
let
  admin = "haru02w";
  ifGroupsExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  imports = (builtins.attrValues outputs.nixosModules) ++ [
    ./hardware-configuration.nix
    ../segments/common/global.nix
    ../segments/common/hyprland-desktop.nix
    # ../segments/laptop.nix
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga401
  ];

  networking.hostName = "qemu";

  # TODO:bootloader

  # Users
  users.users = {
    "${admin}"= {
      isNormalUser = true;
      extraGroups = ifGroupsExist [ 
        "wheel"
        "networkmanager"
        "video"
        "audio"
        "libvirtd"
        "network"
        "git"
      ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [];
    };
    # more
  };
  home-manager.users.${admin} = import ../../home/${admin}/${config.networking.hostName}.nix;
}