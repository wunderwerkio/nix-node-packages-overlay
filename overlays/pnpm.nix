final: prev: let
  version = "9.1.0";
  sha256 = "sha256-IuNvun9IgOz3SaXKEouENdoIXs1JV15/ueZNa/T605Q=";
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
