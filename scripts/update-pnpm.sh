#!/bin/sh

echo "Checking potential update for pnpm"

current_version=$(cat overlays/pnpm.nix | grep -oP 'version = "\K[^"]+')
latest_version=$(curl -sSL https://registry.npmjs.org/pnpm | grep -oP '"latest":"\K[^"]+')

echo "Current version: $current_version"
echo "Latest version:  $latest_version"

if [ "$current_version" != "$latest_version" ]; then
  echo "Found update!"

  prefetch_hash=$(nix-prefetch-url "https://registry.npmjs.org/pnpm/-/pnpm-$latest_version.tgz" 2>/dev/null)
  sha256_hash=$(nix hash to-base64 --type sha256 "$prefetch_hash")

  sed -i "s/version = \".*\";/version = \"$latest_version\";/" overlays/pnpm.nix
  sed -i "s/sha256 = \".*\";/sha256 = \"sha256-$sha256_hash\";/" overlays/pnpm.nix
else
  echo "No update found!"
fi
