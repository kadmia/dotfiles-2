{ config, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = super: rec {
    # ghc 8.0.2
    haskell802Packages = super.haskell.packages.ghc802.override {
      overrides = my802haskellPackages false;
    };
    profiledHaskell802Packages = super.haskell.packages.ghc802.override {
      overrides = my802haskellPackages true;
    };
    my802haskellPackages = libProf: self: super:
      with pkgs.haskell.lib;
      rec {
        ghc-syb-utils = pkgs.haskell.lib.dontCheck super.ghc-syb-utils;
        mkDerivation = args: super.mkDerivation (args // {
          enableLibraryProfiling = libProf;
          enableExecutableProfiling = false;
        });
      };
    ghc80Env = super.pkgs.buildEnv {
      name = "ghc80";
      paths = with haskell802Packages; [
        ( ghcWithHoogle ( haskellPackages: with haskellPackages; [
            QuickCheck
            aeson
            amqp
            array
            async
            attoparsec
            base
            bytestring
            containers
            directory
            hakyll
            hashable
            hspec
            hspec-expectations-pretty-diff
            lens
            linear
            logging
            memoize
            mtl
            pandoc
            quickcheck-instances
            regex-compat
            scotty
            stm
            template-haskell
            text
            timeit
            vector
            wai
            wai-app-static
            wai-cors
            wai-extra
            wai-logger
            wai-middleware-static
            wai-routes
          ] )
        )
        alex
        cabal-install
        cabal2nix
        ghc-core
        ghc-mod
        hakyll
        happy
        hasktags
        hindent
        hlint
        hpack
        pandoc
        stylish-haskell
        threadscope
      ];
    };
    ghc80ProfEnv = super.pkgs.myEnvFun {
      name = "ghc80prof";
      buildInputs = with profiledHaskell802Packages; [
        profiledHaskell802Packages.ghc
        cabal-install
        ghc-core
        hlint
        hasktags
      ];
    };
    # ghc 8.2.1
    haskell821Packages = super.haskell.packages.ghc821.override {
      overrides = my821haskellPackages false;
    };
    profiledHaskell821Packages = super.haskell.packages.ghc821.override {
      overrides = my821haskellPackages true;
    };
    my821haskellPackages = libProf: self: super:
      with pkgs.haskell.lib;
      rec {
        ghc-syb-utils = pkgs.haskell.lib.dontCheck super.ghc-syb-utils;
        mkDerivation = args: super.mkDerivation (args // {
          enableLibraryProfiling = libProf;
          enableExecutableProfiling = false;
        });
      };
    ghc82Env = super.pkgs.buildEnv {
      name = "ghc82";
      paths = with haskell821Packages; [
        ( ghcWithHoogle ( haskellPackages: with haskellPackages; [
            QuickCheck
            aeson
            amqp
            async
            attoparsec
            base
            bytestring
            containers
            directory
            hspec
            hspec-expectations-pretty-diff
            lens
            linear
            mtl
            quickcheck-instances
            regex-compat
            scotty
            stm
            template-haskell
            text
            vector
          ] )
        )
        cabal-install
        cabal2nix
      ];
    };
    ghc82ProfEnv = super.pkgs.myEnvFun {
      name = "ghc82prof";
      buildInputs = with profiledHaskell821Packages; [
        profiledHaskell821Packages.ghc
        cabal-install
        ghc-core
        hlint
        hasktags
      ];
    };
  };
}
