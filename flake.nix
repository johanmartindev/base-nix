{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pythonPackages = ps: with ps; [
          requests
          pytest
          black
        ];
        pythonEnv = pkgs.python311.withPackages pythonPackages;

      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            pythonEnv
            nodejs_24
            git
            ripgrep
            jq
          ];
          shellHook = ''
            echo "Welcome to the development shell!"
          '';
          PROJECT_NAME = "base_nix";
          NODE_ENV = "development";
        };
      }
    );
  }
