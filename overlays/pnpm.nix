final: prev: let
  version = "9.0.6";
  sha256 = "sha256-BiTjDv+GbN6zY7FQYb23/ZQlsXvBu0LCL19O/eoh9rM=";
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
