#!/bin/bash
black .
pylint hdlopt/
flake8 hdlopt/