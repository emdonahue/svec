# svec
Streaming computations over sparse vectors and matrices for use in text mining and NLP using standard unix tools

svec contains a collection of subcommands that operate on a common format for sparse vectors and matrices. Each vector or matrix is a text file each line of which contains space-separated alpha-numeric labels for the dimensions, followed by a tab, followed by the numeric value of that particular cell in the vector or matrix. Canonically, files are sorted by dimension. For instance, the 2x2 matrix with dimensions a and b would have the following representation:

```
a a	1
a b	2
b a	3
b b	4
```

The subcommands all operate on this common format, and emphasize streaming and disk-based computations in order to handle large matrices that cannot fit in memory.

## Documentation
```
usage: svec <subcommand> [arguments]
	cooccurrences - Prints a 2D matrix of counts of token co-occurrence within a given window computed from a whitespace-separated file of tokens
	counts - Prints a vector of counts from a newline-separated stream of tokens
	--help|-h|help - Print the list of subcommands or help information for a specific subcommand (e.g. "svec help dot")
	join - Concatenates numerical values with the same indices together for further processing (summation, multiplication, etc.)
	scale - Scale all elements by a constant
	sum - Element-wise sum
	word2vec - Computes matrix of log pointwise mutual information scores from the co occurrence matrix of a stream of whitespace-separated tokens that approximates word2vec embeddings.
```
