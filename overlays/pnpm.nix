final: prev: let
  version = "8.15.6";
  sha256 = "sha256-AcAe65kON5sx7xnAPp0GoUr6UlC4LoEwP4hyHJn/Lm8=";
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
