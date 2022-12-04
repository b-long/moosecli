# pylint: disable=missing-module-docstring
__version__ = "0.1.0"
import typer
import sys

from moosecli.lib import main

if __name__ == "__main__":
    typer.run(main)


from ._package import setup_frozen_package

if getattr(sys, "frozen", False):
    setup_frozen_package()