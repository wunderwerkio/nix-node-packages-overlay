{pkgs}: {
  # Overlays `overlay` on top of the default pkgs.nodePackages.
  overlayNodePackages = overlay: {
    nodePackages = pkgs.nodePackages // overlay;
  };
}
