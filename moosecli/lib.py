# pylint: disable=missing-module-docstring,invalid-name,line-too-long,missing-function-docstring
import os
import pkgutil
from pathlib import Path

from cryptography import x509

import typer

app = typer.Typer(help="Welcome to Moose CLI.")

def do_thing_with_package_data(name: str, output_path: Path):
    pkg_resource = "data/something.md"
    data = pkgutil.get_data("moosecli", pkg_resource)
    data_decoded = str(data.decode("utf-8"))

    print(f"Creating (dynamic) file using package resource: '{pkg_resource}'")

    with open(output_path, "w", encoding="utf-8") as f:
        f.write(
            f"""{data_decoded} {name}

Dynamic!        
"""
        )

    print("Content written to a file")

@app.command()
def generate_file():
    name: str = typer.prompt(
        "What's your name?",
    )

    # Welcome the user
    print(f"Hello {name}")

    # Set file name and do something with package data
    cwd = Path(os.getcwd())
    fname = cwd / "modified-something.md"
    do_thing_with_package_data(name=name, output_path=fname)

    print(f"Your custom file has been saved to '{fname}'.")


@app.command()
def show_x509():

    # Welcome the user
    print(f"{x509}")