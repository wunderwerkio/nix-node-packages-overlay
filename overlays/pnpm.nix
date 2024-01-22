final: prev: let
  version = "8.14.2";
  sha256 = "sha256-ot0ocgWlO7QyKTdTDUoX+GJp9j/gCmKgPp5FjTrQJ/8=";
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
