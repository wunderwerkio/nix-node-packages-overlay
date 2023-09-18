final: prev: let
  version = "8.7.6";
  sha256 = "sha256-yVhp1EPtj9a3uxZLuOibVsq9wk88ebh+9o2K4cax0OI=";
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
