final: prev: let
  version = "8.15.2";
  sha256 = "sha256-kLtdY4LLLLi41JWaB2s5U9hNHZQSFxcJe81BxxNE+hQ=";
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
