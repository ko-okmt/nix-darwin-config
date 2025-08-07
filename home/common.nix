{ config, pkgs, ... }:

let
  basePackages = with pkgs; [
    git
    ripgrep
    fd
    bat
    zoxide
    starship
    atuin
    eza
    sd
    fzf
    jq
    neovim
    gh
    lazygit
    lazydocker
    direnv
  ];

  goPackages = with pkgs; [
    go
    gopls
    go-tools
    goreleaser
  ];

  nodePackages = with pkgs; [
    nodejs_24
    codex
    pnpm
    bun
  ];

  allPackages = basePackages ++ goPackages ++ nodePackages;

  nvimConfigDir = ../nvim;
in
{
  home.packages = allPackages;

  programs.git = {
    enable = true;

    userName = "Koichiro Okamoto";
    userEmail = "koichiro.okamoto@sansan.com";

    aliases = {
      st = "status";
      co = "checkout";
      ci = "commit";
      br = "branch";
      lg = "log --oneline --graph --all";
      last = "log -1 HEAD";
      fix = "commit --fixup";
      r = "rebase -i";
    };

    extraConfig = {
      core = {
        editor = "nvim";
      };
      pull = {
        rebase = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      la = "eza -la";
      tree = "eza --tree";
    };
  };

  programs.starship.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      keymap_mode = "vim-insert";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.sessionVariables = {
    GOPATH     = "${config.home.homeDirectory}/.go";
    GOMODCACHE = "${config.xdg.cacheHome}/go-mod";
    GOBIN      = "${config.home.homeDirectory}/.local/bin";  # go install で PATH に通るように
  };
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];

  xdg.configFile."nvim/lua/plugins/lsp.lua".source = "${nvimConfigDir}/lua/plugins/lsp.lua";
  xdg.configFile."nvim/lua/plugins/neotest.lua".source = "${nvimConfigDir}/lua/plugins/neotest.lua";
  xdg.configFile."nvim/lua/plugins/gitlinker.lua".source = "${nvimConfigDir}/lua/plugins/gitlinker.lua";
  xdg.configFile."nvim/lua/plugins/vim-abolish.lua".source = "${nvimConfigDir}/lua/plugins/vim-abolish.lua";
  xdg.configFile."nvim/lua/plugins/conform.lua".source = "${nvimConfigDir}/lua/plugins/conform.lua";
  xdg.configFile."nvim/lua/config/options.lua".source = "${nvimConfigDir}/lua/config/options.lua";

  home.stateVersion = "25.05";
}

