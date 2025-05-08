# My NixOS Configurations

This is the repo for all my personal Nix configs, organized in a way where I can share configurations between machines relatively easily.

## Outputs

### NixOS Configuration

- `verum`: Lenovo Ideapad 16IMH9 - 32gb RAM, Ultra 9, 4050 Max-Q (Primary device)

### Packages

- `nvim`: Neovim configured by NixVim

## File Structure

- `nixos`: System level and host-specific configurations.
  - `common`: Configs that may be shared between machine
    - `global`: Configs shared between every machine
    - `opts`: Optional configs
    - `users`: Instantiates users and their HM config
    - `...`: Machine specific configurations which import from `common`
- `home`: Home manager configurations
  - `global`: Configs shared between user accounts on all machines
  - `opts`: Optional configurations, organized by purpose and unthemed
    - `desktop`: GUI desktop configs
    - `common`: Bundles of options for use with multiple DE
  - `theme`: Theme configurations
  - `...`: Machine specific home-manager config
- `nvim`: NixVim configuration
- `assets`: Images that I want to use (Bristol says hi)

## Secrets

Secrets are managed using [sops-nix](https://github.com/Mic92/sops-nix/.gita) and are encrypted using my PGP key and SSH private keys. Each machine shares common secrets and has their own secrets file.

## Installation

Installation uses nixos-anywhere to install using the following command

```
./deploy.sh <configuration name> <user@address> <path to private SSH key>
```

This assumes that you have atleast one device running Nix (the OS or package manager). When installing on non-public facing devices, follow the [docs](https://github.com/nix-community/nixos-anywhere/blob/main/docs/howtos/no-os.md).
