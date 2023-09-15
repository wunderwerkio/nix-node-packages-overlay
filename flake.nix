{
  inputs = {nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";};

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    pnpmOverlay = import ./overlays/pnpm.nix;
  in {
    overlays = {
      pnpm = pnpmOverlay;
    };

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
