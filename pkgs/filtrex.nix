{
  lib,
  mkYarnPackage,
  fetchYarnDeps,
  fetchFromGitHub
}:

mkYarnPackage rec {
  pname = "filtrex";
  version = "2.2.0";

  src = fetchFromGitHub {
    owner = "m93a";
    repo = "filtrex";
    rev = "v${version}";
    hash = "sha256-PV6HqoDIJPoQ6jEozGbT+wEmVzKg2bWw5LMDmk+R09A=";
  };

  offlineCache = fetchYarnDeps {
    name = "${pname}-yarn-offline-cache";
    yarnLock = src + "/yarn.lock";
    hash = "sha256-nl1dmvIuIZpc9rcB54rqdMDNhCuiCpjBYWpAArFKgnk=";
  };

  buildPhase = ''
    runHook preBuild

    rm -rf ./dist
    rm -rf ./deps/filtrex/dist

    yarn run build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir $out
    cp -r ./deps/filtrex/dist/* $out

    runHook postInstall
  '';

  doDist = false;

  meta = with lib; {
    description = "A simple, safe, JavaScript expression engine, allowing end-users to enter arbitrary expressions without p0wning you";
    homepage = "https://github.com/m93a/filtrex";
    license = licenses.mit;
    maintainers = with maintainers; [ jsqu4re ];
  };
}

