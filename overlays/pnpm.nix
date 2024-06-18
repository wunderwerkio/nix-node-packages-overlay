final: prev: let
  version = "9.4.0";
  sha256 = "sha256-tv0L/aVV5+WErX5WswxosB1aBPnuk5ifS5PKhHPEnHQ=";
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
