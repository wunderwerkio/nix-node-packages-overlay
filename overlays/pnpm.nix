final: prev: let
  version = "8.9.2";
  sha256 = "sha256-jWJXPZMGHycit7SMlznpbNRgPDqxU7yBxhncuYYaIU4=";
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
