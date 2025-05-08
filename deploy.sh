#!/usr/bin/env bash
set -e

temp=$(mktemp -d)

cleanup() {
  rm -rf "$temp"
}
trap cleanup EXIT

install -dm755 "$temp/persist/etc/ssh/"

cp $2 "$temp/persist/etc/ssh/ssh_host_ed25519_key"

nix run github:nix-community/nixos-anywhere -- --flake ".#$1" --extra-files"$temp" "${@:3}"
