final: prev: let
  version = "9.0.1";
  sha256 = "sha256-RtUO4q/stCsYXrvWYtx73VLvW+Vr8DW7YVyrgadTRd8=";
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
