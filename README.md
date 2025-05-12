Collection of my NixOS configurations for my own devices. Not intended to be very portable or modular, though editing the `nixos` directory would be the place to start if you were trying to run this config on a different machine. Still trying to maintain git history of the config, even in the case that it is a complete refactor.

## File Structure

- `assets`: Images that I use in config (Bristol says hi!)
- `home`: Home-manager configurations
  - `desktop`: Desktop environment, currently [Niri](https://github.com/YaLTeR/niri)
  - `programs`: Program configurations
    - `cli`: Command line programs (ie. git, ssh)
    - `desktop`: Programs that run on a DE (ie. Firefox)
    - `unfree`: Unfree programs
- `nixos`: System level configurations
- `nvim`: NixVim configuration

## Secrets

Secrets are managed using [sops-nix](https://github.com/Mic92/sops-nix) and are encrypted using my PGP key and SSH private keys. System cannot be built without at least on secret as the user account depends on one.
