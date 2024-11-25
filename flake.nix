{
  description = "Rust Template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        rustc
        cargo
        clippy
        rustfmt
        rust-analyzer
      ];


      shellHook = ''
        clear
        echo "Rust Development Environment"
        rustc --version
        cargo --version
      '';
    };
  };
}
