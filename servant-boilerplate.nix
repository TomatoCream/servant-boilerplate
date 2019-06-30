{ mkDerivation, aeson, base, hspec, hspec-wai, hspec-wai-json
, servant-server, stdenv, wai, warp
}:
mkDerivation {
  pname = "servant-boilerplate";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ aeson base servant-server wai warp ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [ aeson base hspec hspec-wai hspec-wai-json ];
  homepage = "https://github.com/githubuser/servant-boilerplate#readme";
  license = stdenv.lib.licenses.bsd3;
}
