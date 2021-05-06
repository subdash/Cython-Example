#!/bin/bash

if ! command -v python3 &> /dev/null
then
	echo "Error: python3 not found."
	exit 1
fi

python3 setup.py build_ext --inplace
