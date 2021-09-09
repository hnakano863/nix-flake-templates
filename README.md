# nix-flake-templates
My nix flake template collection

## Prerequisites

You must have already installed Nix and enabled flake support.

- https://nixos.org/download.html
- https://nixos.wiki/wiki/Flakes

## Installation

Add this repository to your [flake registry](https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-registry.html)

```console
$ nix registry add hnakano863-templates github:hnakano863/nix-flake-templates
```

## Usage

You can use any template provided by this repo.

```console
$ nix flake show templates
```

```console
$ nix flake init -t hnakano863-templates#jupyter-shell
```

## Provided templates

### jupyter-shell

jupyter kernel in virtual environment.

```console
$ nix flake init -t hnakano863-templates#jupyter-shell
```

edit the `flake.nix` to add the kernel dependencies which you want.

```nix flake.nix

...

# declare your python kernel deps
env = pkgs.python3.withPackage (ps: with ps; [
  ipykernel
  pandas
  numpy
  scipy
  matplotlib
  seaborn
]

...

```

drop into the shell

```console
$ nix develop

$ jupyter notebook
```

Also, you can use the oridinary python shell

```console
$ nix develop

$ python

>> import pandas as pd

>> pd.__version__

```

and ipython shell.

```console
$ nix develop

$ ipython

[1] import pandas as pd

[2] pd.__version__

```
