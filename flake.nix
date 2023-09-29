{
  description = "A very basic flake";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;

  outputs = { self, nixpkgs }: 
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    pyEnv = pkgs.python3.withPackages (ps: [ ps.matplotlib ps.numpy ]);
  in
  {
    packages."x86_64-linux".default = pkgs.mkShell {
      buildInputs = with pkgs; [ tk pyEnv gpsbabel ];
    };
  };
}
