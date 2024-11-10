{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = with pkgs; [
    rustc
    cargo
    rust-analyzer
    rustfmt   
    clippy

    bacon
  ];

  shellHook = ''
    echo "Welcome to Rust Development Environment"
    rustc --version
    cargo --version
  '';
}
