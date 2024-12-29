final: prev: let
  version = "9.15.2";
  sha256 = "sha256-AiMJuzE1kUK2W/qIngQG0u69Ws//ykfmlErPKdnWpms=";
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
