final: prev: let
  version = "8.15.3";
  sha256 = "sha256-/EpJvWCVUKQeFNIO+86AKkuJKqTKyHcyLeLwkk8SKZE=";
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
