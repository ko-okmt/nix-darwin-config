{ config, pkgs, ... }:

{
  system.stateVersion = 6;

  system.primaryUser = "koichiro.okamoto";

  # ホスト名
  networking.hostName = "koichiro-mac-work";

  # brew cask 管理
  homebrew = {
    enable = true;

    brews = [
      "vips"
      "libyaml"
      "openssl"
    ];

    casks = [
      "raycast"
      "rectangle"
      "chatgpt"
      "obsidian"
      "1password"
      "font-hack-nerd-font"
      "orbstack"
      "ghostty"
      "discord"
      "spotify"
      "docker-desktop"
      "session-manager-plugin"
      "tableplus"
      "maccy"
      "font-google-sans-code"
      "aws-vpn-client"
      "brave-browser"
    ];

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
  };

  programs.zsh.enable = true;

  users.users."koichiro.okamoto" = {
    home = "/Users/koichiro.okamoto";
  };
}

