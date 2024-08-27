final: prev: let
  version = "9.9.0";
  sha256 = "sha256-ekJh5Q2aRNkkC69snW4QCJ3PCnnQAH8qJphaaScyQXc=";
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
