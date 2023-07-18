{
  inputs = {nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";};

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    pnpmOverlay = import ./overlays/pnpm.nix;
    vercelOverlay = import ./overlays/vercel;
  in {
    overlays = {
      pnpm = pnpmOverlay;
      vercel = vercelOverlay;
    };

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
