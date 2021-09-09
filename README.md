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
[I 14:52:11.926 NotebookApp] Jupyter Notebook 6.3.0 is running at:
[I 14:52:11.926 NotebookApp] http://localhost:8888/
```

then, you can select the kernel in the env.

![jupyter kernel select](./imgs/nix-shell-kernel.png)

Also, you can use the oridinary python shell

```console
$ nix develop

$ python
Python 3.8.11 (default, Jun 28 2021, 10:57:31)
[GCC 10.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import pandas as pd
>>> pd.__version__
'1.2.3'
>>>
```

and ipython shell.

```console
$ nix develop

$ ipython
Python 3.8.11 (default, Jun 28 2021, 10:57:31)
Type 'copyright', 'credits' or 'license' for more information
IPython 7.21.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]: import pandas as pd

In [2]: pd.__version__
Out[2]: '1.2.3'

In [3]:
```
