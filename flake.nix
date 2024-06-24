{
  description = "Sphinx Needs overlay for Nixpkgs";

  outputs = { self, ... }: {
    overlays.sphinx-needs = import ./sphinx-needs-overlay.nix;
    
    overlays.default = {};
  };
}