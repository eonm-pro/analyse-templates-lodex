{
  description = "Lodex template analysis: reproducible environment (local + Onyxia)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});

      # Tools used by harvest.sh (local) and init.sh (Onyxia)
      tools =
        pkgs: with pkgs; [
          bash
          coreutils
          findutils
          gnutar
          gzip
          unzip
          zip
          jq
          duckdb
          minio-client # provides `mc`
        ];
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          name = "lodex-analysis";
          packages = tools pkgs;
        };
      });

      packages = forAllSystems (pkgs: {
        default = pkgs.buildEnv {
          name = "lodex-analysis-env";
          paths = tools pkgs;
        };
      });
    };
}
