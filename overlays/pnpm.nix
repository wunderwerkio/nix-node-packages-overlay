final: prev: let
  version = "8.7.5";
  sha256 = "sha256-xpxU2BxY4j7iMyRynmjQEv4+87fmLi3FIbEUHCo2Vn4=";
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
