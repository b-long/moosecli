# pylint: disable=missing-module-docstring
__version__ = "0.1.1"
import sys

from moosecli.lib import app

from ._package import setup_frozen_package

if __name__ == "__main__":
    app()

if getattr(sys, "frozen", False):
    setup_frozen_package()
