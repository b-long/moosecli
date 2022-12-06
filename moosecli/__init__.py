# pylint: disable=missing-module-docstring
__version__ = "0.1.0"
import sys

import typer

from moosecli.lib import main

from ._package import setup_frozen_package

if __name__ == "__main__":
    typer.run(main)

if getattr(sys, "frozen", False):
    setup_frozen_package()
