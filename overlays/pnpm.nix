final: prev: let
  version = "9.0.5";
  sha256 = "sha256-Yb1mkTtSASEH7CWm7k1qFhAhq5ngT2rO46pQ0ONLSvk=";
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
