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
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs_24
            typescript
            typescript-language-server
            tsx
            yarn
            pnpm
            corepack
            nodemon
            node2nix
            ripgrep
            jq
            mise
            rustc
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
