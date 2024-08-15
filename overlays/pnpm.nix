final: prev: let
  version = "9.7.1";
  sha256 = "sha256-RvG7yPgCCqmGlWjDhxmPGoE/IftEyC9ADn0dvebHC0A=";
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
