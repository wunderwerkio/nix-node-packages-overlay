final: prev: let
  version = "9.1.3";
  sha256 = "sha256-f2MAHtwHfxz/lsrLqQHzUHlih6KADfqD/omPlBg+T18=";
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
