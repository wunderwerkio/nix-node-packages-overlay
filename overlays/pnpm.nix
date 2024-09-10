final: prev: let
  version = "9.10.0";
  sha256 = "sha256-NVqKuNu2rUG+++85vE/Wtd+F4Sdh0nJL0B8T6HjeSxM=";
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
