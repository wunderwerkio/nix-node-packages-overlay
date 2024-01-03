final: prev: let
  version = "8.14.0";
  sha256 = "sha256-nOv2Gr2D9oF3spSE2nLal1E5DqrUbfwwctJmv7sbp78=";
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
