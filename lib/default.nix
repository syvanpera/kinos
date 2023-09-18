{ pkgs, eachDefaultSystem }:

{
  mkEnv = { toolchains ? [], packages ? [], shellHook ? "" }:
    eachDefaultSystem (system: {
      devShells.default = pkgs.mkShell {
        packages = toolchains ++ packages;
        inherit shellHook;
      };
    });

  toolchains = import ./toolchains { inherit pkgs; };
}
