final: prev: let
  version = "9.1.1";
  sha256 = "sha256-lVHoA9y3oYOf31QWFTqEQGDHvOATIYzoI0EFMlBKwQs=";
  lib = import ../lib {pkgs = prev;};
in
  lib.overlayNodePackages {
    pnpm-latest = prev.nodePackages.pnpm.override {
      inherit version;
      src = prev.fetchurl {
        inherit sha256;

        url = "https://registry.npmjs.org/pnpm/-/pnpm-${version}.tgz";
      };
    };
  }
