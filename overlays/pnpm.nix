final: prev: let
  version = "9.1.2";
  sha256 = "sha256-GcF1KPnKIL1ELkykLwDxuYCKnLQZODzQS6Mu8ZMiq6c=";
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
