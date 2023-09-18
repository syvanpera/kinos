{
  description = "A Nix flake for an Azure environment";

  inputs = {
    # The Azure CLI version in unstable doesn't currently work
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "azure";

          packages = with pkgs; [
            azure-cli
          ];

          shellHook = ''
            echo "Welcome to Azure Nix shell"
            echo ""
            az version -o table
          '';
        };
      }
    );
}
