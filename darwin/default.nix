{ config, pkgs, ... }:

{
  system.stateVersion = 6;

  system.primaryUser = "koichiro_okamoto";

  # ホスト名
  networking.hostName = "koichiro-mac";

  # brew cask 管理
  homebrew = {
    enable = true;

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
      "tableplus"
      "maccy"
      "font-google-sans-code"
      "brave-browser"
      "google-chrome"
      "zed"
    ];

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
  };

  programs.zsh.enable = true;

  users.users."koichiro_okamoto" = {
    home = "/Users/koichiro_okamoto";
  };
}

