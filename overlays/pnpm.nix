final: prev: let
  version = "8.14.1";
  sha256 = "sha256-LfeOZdQz12k7nT+9r0MbLZa7T5ai/+zVGlDv4W5Qpqg=";
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
