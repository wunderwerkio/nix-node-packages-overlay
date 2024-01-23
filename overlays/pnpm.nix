final: prev: let
  version = "8.14.3";
  sha256 = "sha256-LQNju2wxTapnCH7wd0PuobouLTYMg16P7GtVdeTtlIQ=";
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
