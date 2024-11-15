final: prev: let
  version = "9.13.2";
  sha256 = "sha256-zM6Bv3SYxfD4DjF0nB+PA7q6mdFo9kWQ/H4T+tPqGTg=";
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
