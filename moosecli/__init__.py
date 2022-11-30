# pylint: disable=missing-module-docstring
__version__ = "0.1.0"
import typer

from moosecli.lib import main

if __name__ == "__main__":
    typer.run(main)
