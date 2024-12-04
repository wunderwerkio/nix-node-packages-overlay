final: prev: let
  version = "9.14.4";
  sha256 = "sha256-JqcmtjO2KaP6vaAG9pauQmCVSjYyyAVBEteuiXeeX5o=";
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
