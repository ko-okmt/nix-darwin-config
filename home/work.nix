{ pkgs, ... }:
{
  home.packages = with pkgs; [
    google-cloud-sdk
    awscli2
    devbox
    dotenvx
    zstd
  ];
}
