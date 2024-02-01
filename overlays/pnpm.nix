final: prev: let
  version = "8.15.1";
  sha256 = "sha256-JF/pAfjn+oeC1/F9MraoOZXirgOYTLW2K4lJv9wnx7U=";
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
