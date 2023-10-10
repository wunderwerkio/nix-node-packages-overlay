final: prev: let
  version = "8.9.0";
  sha256 = "sha256-j1JkrR0QDaEaat1ruKlMbx6RP56SYbKlUfq++tLsD+w=";
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
