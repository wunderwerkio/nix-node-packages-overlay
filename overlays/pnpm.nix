final: prev: let
  version = "9.12.2";
  sha256 = "sha256-LvblR7CwfYQdYFJA3OTWNWd4MRSM0w9tVkuPT5KPc9I=";
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
