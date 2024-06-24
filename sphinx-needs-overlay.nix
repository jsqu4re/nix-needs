self: super:

{
  sphinx-needs = super.callPackage ./pkgs/sphinx-needs.nix{
    sphinx-data-viewer = self.sphinx-data-viewer;
  };
  sphinxcontrib-test-reports = super.callPackage ./pkgs/sphinxcontrib-test-reports.nix{
    sphinx-needs = self.sphinx-needs;
  };
  sphinx-data-viewer = super.callPackage ./pkgs/sphinx-data-viewer.nix{ };
  sphinx-simplepdf = super.callPackage ./pkgs/sphinx-simplepdf.nix{ };
  sphinx-preview = super.callPackage ./pkgs/sphinx-preview.nix{ };
  sphinx-immaterial = super.callPackage ./pkgs/sphinx-immaterial.nix{ };
}