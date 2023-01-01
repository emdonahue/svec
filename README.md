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
	analogy - Computes the analogy vector from 3 word2vec embeddings king:man::queen:woman => -king+man+queen=woman
	cooccurrences - Prints a 2D matrix of counts of token co-occurrence within a given window computed from a whitespace-separated file of tokens
	counts - Prints a vector of counts from a newline-separated stream of tokens
	detriangularize - Computes a dense 2D matrix from a triangular matrix by copying values across the diagonal
	--help|-h|help - Print the list of subcommands or help information for a specific subcommand (e.g. "svec help dot")
	join - Concatenates numerical values with the same indices together for further processing (summation, multiplication, etc.)
	negate - Negates a vector
	norm - Computes the Euclidean norm of a vector, or an entry-wise Euclidean norm of a matrix
	scale - Scale all elements by a constant
	sum - Element-wise sum of 2 or more vectors
	word2vec - Computes matrix of log pointwise mutual information scores from the co occurrence matrix of a stream of whitespace-separated tokens that approximates word2vec embeddings
```
