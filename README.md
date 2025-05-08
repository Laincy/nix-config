# My NixOS Configurations

This is the repo for all my personal Nix configs, organized in a way where I can share configurations between machines relatively easily.

## Outputs

### NixOS & HM Configurations

- `verum`: Lenovo Ideapad 16IMH9 - 32gb RAM, Ultra 9, 4050 Max-Q (Primary device)
- `axiom`: Oracle Ampere Instance - 32gb RAM, 4 vCPU (Personal server)

### Packages

- `nvim`: Neovim configured by NixVim
- `axiom_oracle`: A qcow2 image for the axiom config

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
  - `*.nix`: Machine specific home-manager config
- `nvim`: NixVim configuration
- `assets`: Images that I want to use (Bristol says hi)
