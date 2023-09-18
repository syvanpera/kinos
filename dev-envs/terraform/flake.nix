{
  description = "A Nix flake for a Terraform environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "terraform";

          packages = with pkgs; [
            terraform
          ];

          shellHook = ''
            echo "Welcome to Terraform Nix shell"
            echo ""
            terraform --version
          '';
        };
      }
    );
}
