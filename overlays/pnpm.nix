final: prev: let
  version = "8.6.8";
  sha256 = "sha256-Cts7uhoGWJb+tEBsSJ+D8JteDGHONc3kLV5+V/riK3k=";
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
