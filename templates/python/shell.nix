{ lib, pkgs ? import <nixpkgs> {
  #config = {
  #  allowUnfree = true;
  #  cudaSupport = true;
  #};
} }:
pkgs.mkShell {
  packages = [
    (lib.optional pkgs.config.cudaSupport pkgs.cudaPackages.cudatoolkit)
    (pkgs.python3.withPackages (ps: with ps;[
      pip
      #pytorch-bin
    ]))
  ];

  shellHook = ''
    # Tells pip to put packages into $PIP_PREFIX instead of the usual locations.
    # See https://pip.pypa.io/en/stable/user_guide/#environment-variables.
    export PIP_PREFIX=$(pwd)/_build/pip_packages
    export PYTHONPATH="$PIP_PREFIX/${pkgs.python3.sitePackages}:$PYTHONPATH"
    export PATH="$PIP_PREFIX/bin:$PATH"
    unset SOURCE_DATE_EPOCH
  '';
}
