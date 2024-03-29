{ pkgs, ... }: {
  home.packages = with pkgs; [
    irssi # irc client
    progress # monitor progress of GNU utils
    libqalculate # calculator
    ncdu # tui disk usage analizer
    pulsemixer # tui pulse mixer
    powertop # power status
    btop # general system status
    htop # general system status
    neofetch # system info
    pfetch # system info
    tldr # simpler man
    bitwarden-cli # password manager
  ];
}
