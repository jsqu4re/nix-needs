self: super:

{
  pythonPackagesExtensions = super.pythonPackagesExtensions ++ [
    (
      python-self: python-super: {
        sphinxcontrib-plantuml = python-super.sphinxcontrib-plantuml.overrideAttrs (old: {
          patches = (old.patches or []) ++ [
            ../pkgs/patches/lazyloading.patch
          ];
        });
        sphinx-needs = python-self.callPackage ../pkgs/sphinx-needs.nix{
          sphinx-data-viewer = python-self.sphinx-data-viewer;
        };
        sphinxcontrib-test-reports = python-self.callPackage ../pkgs/sphinxcontrib-test-reports.nix{
          sphinx-needs = python-self.sphinx-needs;
        };
        sphinx-data-viewer = python-self.callPackage ../pkgs/sphinx-data-viewer.nix{ };
        sphinx-simplepdf = python-self.callPackage ../pkgs/sphinx-simplepdf.nix{ };
        sphinx-preview = python-self.callPackage ../pkgs/sphinx-preview.nix{ };
        sphinx-immaterial = python-self.callPackage ../pkgs/sphinx-immaterial.nix{ };
      }
    )
  ];
  filtrex = self.callPackage ../pkgs/filtrex.nix { };
}
