{
    python3Packages,
    fetchFromGitHub,
    poetry-core,
    setuptools,
    jsonschema,
    requests,
    requests-file,
    sphinx,
    sphinx-data-viewer,
    sphinxcontrib-jquery,
    sphinxcontrib-plantuml,
    sphinx-design
}:

python3Packages.buildPythonPackage rec {
  pname = "sphinx-needs";
  version = "2.2.0";
  src = fetchFromGitHub {
    owner = "useblocks";
    repo = "sphinx-needs";
    rev = "1de1a7a047bfc7912ea0aa779ffb187def7a5254";
    sha256 = "sha256-UXlnXLWMflrGrB1Sj6QujMbejmFB6tnTpztEP3ZCBv8=";
  };
  format = "pyproject";

  patches = [
    ./patches/requests-file-version.patch
  ];

  nativeBuildInputs = [
    poetry-core
    setuptools
  ];

  propagatedBuildInputs = [
    jsonschema
    requests
    requests-file
    sphinx
    sphinx-data-viewer
    sphinxcontrib-jquery
    sphinxcontrib-plantuml
    sphinx-design
  ];
}