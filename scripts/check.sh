#!/bin/bash
black --check .
pylint hdlopt/
flake8 hdlopt/
mypy hdlopt/