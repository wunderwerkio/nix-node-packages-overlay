final: prev: let
  version = "9.6.0";
  sha256 = "sha256-2uD36CLFayCXm7WWXjtzuL2rtri47xIdpthXUIWZyjU=";
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
