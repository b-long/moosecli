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
cd dist/
du -sh portable_cli 
# 724K    portable_cli
```

## Interaction

Once built, copy the file from `dist/portable_cli` to 
a computer with Python 3.8+ .