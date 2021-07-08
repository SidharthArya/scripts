{pkgs ? import <nixpkgs> { }}:
pkgs.mkShell {
  buildInputs = [
    pkgs.chromedriver
    pkgs.google-chrome
    pkgs.python3
    pkgs.python3.pkgs.selenium

  ];
  
}
