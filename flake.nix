{
  description = "macOS setup with nix-darwin + home-manager + brew casks";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, darwin, home-manager, ... }:
    let
      system = "aarch64-darwin";
      username = "koichiro_okamoto";
      realUser = "koichiro_okamoto";
    in {
      darwinConfigurations.${username} = darwin.lib.darwinSystem {
        inherit system;

        modules = [
          { nixpkgs.overlays = [
            (final: prev: {
               unstable = import nixpkgs-unstable {
                  inherit system;
                  config.allowUnfree = true;
                };
              })
            ];
          }

          ./darwin/default.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${realUser} = import ./home/home.nix;
          }
        ];
      };
    };
}

