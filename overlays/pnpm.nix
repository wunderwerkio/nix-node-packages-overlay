final: prev: let
  version = "9.2.0";
  sha256 = "sha256-lPqyE98iHFW2lWsUoiZMIcYgPMqfCzuV/y/puEsSA5A=";
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
