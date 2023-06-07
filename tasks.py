import os
import sys

from invoke import task


@task
def oxidize(c, docs=False, bytecode=False, extra=""):
    """
    Build a moosecli binary with PyOxidizer.
    """

    env = os.environ.copy()
    env["PIP_REQUIRE_VIRTUALENV"] = "0"

    # standalone_static doesn't work on macOS and gives us musl builds on
    # Linux. Since -- unlike on Windows -- you get one binary on both, dynamic
    # standalone ~should be fine~.
    if sys.platform == "win32":
        flavor = "standalone_static"
    else:
        flavor = "standalone"

    c.run("poetry install")

    c.run("pyoxidizer -V")
    c.run(
        f"pyoxidizer build --release --var flavor {flavor} --var platform {sys.platform}"
    )
