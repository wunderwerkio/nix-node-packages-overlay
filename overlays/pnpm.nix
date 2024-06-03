final: prev: let
  version = "9.1.4";
  sha256 = "sha256-MKGAGsTnI3ee/tE6IfTDn562yfu0ztEBvOBrQiWT18k=";
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
