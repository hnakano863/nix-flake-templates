{
  description = "hnakano863's nix flake template collection.";

  outputs = { self }: {

    templates = {

      jupyter-shell = {
        path = ./jupyter-shell;
        description = "jupyter kernel in virtual environment";
      };

    };

  };
}
