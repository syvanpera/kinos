{
  description = "Nietos - a bunch of flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    let
      system = "x86_64-linux"; # 64-bit Intel/AMD Linux
      pkgs = import nixpkgs { inherit system; };
    in {
      lib = import ./lib {
        inherit pkgs;
        inherit (flake-utils.lib) eachDefaultSystem;
      };
    };
}
