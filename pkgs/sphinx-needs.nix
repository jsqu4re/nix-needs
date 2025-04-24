{
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
  version = "3.0.0";
  src = fetchFromGitHub {
    owner = "useblocks";
    repo = "sphinx-needs";
    rev = version;
    sha256 = "sha256-1xtMmIKfGOi7qFYFtYBrdwSk7BJ8M0ifVJMSLfKqA04=";
  };
  format = "pyproject";

  patches = [
    # ./patches/requests-file-version.patch
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
