final: prev: let
  version = "9.7.0";
  sha256 = "sha256-s1AY+/qPWDZosmSeQHkipyE1XNgfYb7rSsHUJY5YVVk=";
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
