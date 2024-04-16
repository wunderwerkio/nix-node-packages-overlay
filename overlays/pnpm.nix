final: prev: let
  version = "9.0.0";
  sha256 = "sha256-vfyaezcrXEYhdpk+WGSSYD4g2lhk0viIHtwkYkgsdvo=";
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
