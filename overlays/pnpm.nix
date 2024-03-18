final: prev: let
  version = "8.15.5";
  sha256 = "sha256-S076EkkOUFXVm5ufyUOLfVgaa3rztWdetcX0R87hpYk=";
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
