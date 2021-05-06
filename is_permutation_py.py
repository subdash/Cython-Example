#!/usr/bin/env python3

import sys

def is_permutation(s1, s2):
	def make_lookup(s):
		lookup = {}
		for i in range(0, len(s)):
			if s[i] in lookup.keys():
				lookup[s[i]] += 1
			else:
				lookup[s[i]] = 1

		return lookup

	s1_lookup = make_lookup(s1)
	s2_lookup = make_lookup(s2)

	for k in s1_lookup.keys():
		if k not in s2_lookup.keys():
			return False
		if s1_lookup[k] != s2_lookup[k]:
			return False

	return True

