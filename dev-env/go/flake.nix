{
  description = "A Nix flake for a Go environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        goVersion = 21;
        overlays = [ (final: prev: { go = prev."go_1_${toString goVersion}"; }) ];

        pkgs = import nixpkgs { inherit system overlays; };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "golang";

          packages = with pkgs; [
            go
            gotools
          ];

          shellHook = ''
            echo "Welcome to Go Nix shell"
            echo ""
            go version
          '';
        };
      }
    );
}
