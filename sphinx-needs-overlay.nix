self: super:

{
  sphinx-needs = super.callPackage ./sphinx-needs.nix{
    sphinx-data-viewer = self.sphinx-data-viewer;
  };
  sphinxcontrib-test-reports = super.callPackage ./sphinxcontrib-test-reports.nix{
    sphinx-needs = self.sphinx-needs;
  };
  sphinx-data-viewer = super.callPackage ./sphinx-data-viewer.nix{ };
  sphinx-simplepdf = super.callPackage ./sphinx-simplepdf.nix{ };
  sphinx-preview = super.callPackage ./sphinx-preview.nix{ };
  sphinx-immaterial = super.callPackage ./sphinx-immaterial.nix{ };
}