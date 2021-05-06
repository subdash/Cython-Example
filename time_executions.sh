#!/bin/bash

echo "Python implementation"
python3 -m timeit -u usec -s 'from is_permutation_py import is_permutation' 'is_permutation("asdf", "fdsx")'

echo "Cython implementation"
python3 -m timeit -u usec -s 'from is_permutation_cy import is_permutation' 'is_permutation("asdf", "fdsx")'
