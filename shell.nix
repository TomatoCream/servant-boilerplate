{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc865" }:

let
  inherit (nixpkgs) pkgs;
  #final01 = import ./default.nix {};
  ghc = pkgs.haskell.packages.${compiler}.ghcWithPackages (ps: with ps; [
    aeson base servant-server wai warp
  ]);
  systemPackages = with pkgs; [
    # add whatever system packages you want.
    binutils
    gcc
    ghc

    zlib
    zlib.dev
  ];
in
  pkgs.stdenv.mkDerivation {
    name = "servant-boilerplate";
    buildInputs = [ ghc systemPackages ];
    shellHook = ''
      eval $(egrep ^export ${ghc}/bin/ghc)
    '';
}
