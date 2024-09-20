final: prev: let
  version = "9.11.0";
  sha256 = "sha256-HA4z9w5d+e7ehKNXvfoLH526blgZRijUihBVdW9VN1Q=";
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
