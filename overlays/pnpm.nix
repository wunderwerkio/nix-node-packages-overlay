final: prev: let
  version = "8.15.4";
  sha256 = "sha256-zqbQvfLeOgVJWC2jmDxwyS/8V3/0QQy/GQgX3cNRN8I=";
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
