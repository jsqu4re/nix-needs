{
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  flit-core,
  sphinx,
}:

buildPythonPackage rec {
  pname = "sphinx-data-viewer";
  version = "0.1.5";
  src = fetchFromGitHub {
    owner = "useblocks";
    repo = "sphinx-data-viewer";
    rev = "v${version}";
    sha256 = "sha256-m/BZ16b3rmQyRKEMqX1kMHAn6dIWoC6/QDvWUnkopjE=";
  };
  format = "pyproject";

  patches = [
    # ./patches/sphinx-data-viewer-build-tool.patch
  ];

  nativeBuildInputs = [
    poetry-core
    flit-core
    sphinx
  ];

  propagatedBuildInputs = [
  ];
}
