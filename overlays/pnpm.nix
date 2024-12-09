final: prev: let
  version = "9.15.0";
  sha256 = "sha256-Caj+MaNP2nBjVGgGGfQAL0zO9trf+TJA0k72yDHw/Sg=";
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
