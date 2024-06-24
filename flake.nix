{
  description = "Sphinx Needs overlay for Nixpkgs";

  outputs = { self, ... }: {
    # Default overlay.
    overlay = import ./default.nix;
  };
}