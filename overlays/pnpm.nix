final: prev: let
  version = "9.14.2";
  sha256 = "sha256-BuZaSWW6/21gl/nI91w19tQgl028A9d1AJBWpp7f0nE=";
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
