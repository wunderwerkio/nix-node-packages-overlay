final: prev: let
  version = "9.8.0";
  sha256 = "sha256-Vqnna1F5bKf3O4XkTPg3EoYgkfTUmMDOTVt+zca6GPc=";
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
