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
      packages = with pkgs; [
        rustc
        cargo
        rust-analyzer
        rustfmt   
        clippy

        bacon
        helix
        nil

        git
        toybox
        openssh
      ];

      installPhase = ''
      '';

      shellHook = ''
        clear
        echo " -------------------------------------------"
        echo " | Welcome to Rust Development Environment |"
        echo " -------------------------------------------"
        echo ""
        rustc --version
        cargo --version
        echo ""
      '';
    };
  };
}
