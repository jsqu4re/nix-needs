{
  description = "Sphinx Needs overlay for Nixpkgs";

  outputs = { self, ... }: {
    overlays.sphinx-needs = import ./overlays/sphinx-needs.nix;
    overlays.sphinx-needs-lazy = import ./overlays/sphinx-needs-lazy.nix;

    overlays.default = self.overlays.sphinx-needs;
  };
}