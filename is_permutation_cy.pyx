cdef extern from "string.h":
	void memset(void *s, int c, size_t n)
	size_t strlen(const char *s)


def is_permutation(s1, s2):
	# Convert Python strings to character arrays and compare lengths for early
	# exit.
	cdef bytes ch_array_1 = s1.encode('utf-8')
	cdef bytes ch_array_2 = s2.encode('utf-8')
	cdef int length = strlen(ch_array_1)
	cdef int length2 = strlen(ch_array_2)

	if length != length2:
		return False

	# Create a lookup table
	cdef int lookup[256]
	memset(lookup, 0, 256 * sizeof(int))

	# In the lookup table we will increment the value by 1 each time we count a
	# character in the first char array. We will do almost the same for the
	# second char array, but decrement the value instead.
	cdef int i, idx
	i = 0
	for i in range(0, length):
		idx = ch_array_1[i]
		lookup[idx] += 1

	i = 0
	for i in range(0, length):
		idx = ch_array_2[i]
		lookup[idx] -= 1

	# If the arrays have the exact same characters, the lookup table
	# contains zeroes for each character lookup.
	i = 0
	for i in range(0, length):
		idx = ch_array_1[i]
		if lookup[idx] != 0:
			return False

		idx = ch_array_2[i]
		if lookup[idx] != 0:
			return False

	return True
