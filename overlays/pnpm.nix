final: prev: let
  version = "8.15.0";
  sha256 = "sha256-/R6raKbUA/Nc8yWcU3gNcLDxS9dOOdovkX0gH1VNhmU=";
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
