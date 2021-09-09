{
  description = "jupyter kernel in virtual environment";

  inputs.nixpkgs.url = "nixpkgs/nixos-21.05";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let

      pkgs = nixpkgs.legacyPackages."${system}";

      # Declare your python kernel deps
      env = pkgs.python3.withPackages (ps: with ps; [
        ipykernel
      ]);

      definitions.python3 = {

        displayName = "Python 3 (Nix Shell)";

        argv = [
          env.interpreter
          "-m"
          "ipykernel_launcher"
          "-f"
          "{connection_file}"
        ];

        language = "python";

        logo32 = "${env.sitePackages}/ipykernel/resources/logo-32x32.png";
        logo64 = "${env.sitePackages}/ipykernel/resources/logo-64x64.png";

      };

      jpy = pkgs.jupyter.override { inherit definitions; };

    in {

      devShell = pkgs.mkShell {
        buildInputs = [ env jpy ];
      };

    });
}
