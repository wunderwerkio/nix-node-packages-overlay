final: prev: let
  lib = import ../../lib {pkgs = prev;};
  nodeEnv = import ./node-env.nix {
    inherit (prev) nodejs stdenv lib python2 runCommand writeTextFile writeShellScript;
    pkgs = prev;
    libtool = if prev.stdenv.isDarwin then prev.darwin.cctools else null;
  };
  nodePackages = import ./node-packages.nix {
    inherit nodeEnv;

    inherit (prev) fetchurl fetchgit nix-gitignore stdenv lib;
  };
in
  lib.overlayNodePackages {
    vercel-latest = nodePackages.vercel;
  }
