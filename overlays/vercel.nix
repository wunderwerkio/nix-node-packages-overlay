final: prev: let
  version = "31.0.3";
  sha256 = "sha256-RJHGrr55Wk2d7vgYaBgBsBNS9e375lDdgCo4T13NQKk=";
  lib = import ../lib {pkgs = prev;};
in
  lib.overlayNodePackages {
    vercel-latest = prev.nodePackages.vercel.override {
      inherit version;
      src = prev.fetchurl {
        inherit sha256;

        url = "https://registry.npmjs.org/vercel/-/vercel-${version}.tgz";
      };
    };
  }
