# moosecli

A project template & place to experiment with CLI building.

## Install and run using Poetry
Install the application using Poetry:
```
poetry install
```
Run the application:
```
poetry run python -m moosecli
```
Run the tests:
```bash
# Run tests with unittest
poetry run python -m unittest tests/*.py
# Run tests with unittest (verbose)
poetry run python -m unittest -v tests/*.py
```
## Use as a PEX file
A [pex file](https://pex.readthedocs.io/en/latest/whatispex.html) can
be built using the included shell script:
```bash
./build-pex.sh
```
The file produced should be fairly small:
```bash
du -sh dist/portable_cli
# 18M    dist/portable_cli
```

## Interaction

Once built, copy the file from `dist/portable_cli` to 
a computer with Python 3.8+ .

<!--
## Building binaries
To build a binary, run:
```bash
brew install bazel
poetry run nox -e oxidize
```
Based on:
* https://github.com/elastic/rally/pull/1637/files
* https://github.com/hynek/doc2dash
* https://hynek.me/til/python-portable-binaries/
* https://pyoxidizer.readthedocs.io/en/stable/pyoxidizer_packaging_python_executable.html
-->
