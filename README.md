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
usage: svec <subcommand> [arguments] (All subcommands respect the -g flag to specify the decimal precision of arithmetic)
	abs - Element-wise absolute value
	add - Element-wise sum of 2 or more vectors
	analogy - Computes the analogy vector from 3 word2vec embeddings king:man::queen:woman => -king+man+queen=woman
	cooccurrences - Prints a 2D matrix of counts of token co-occurrence within a given WINDOW computed from a sorted, whitespace-separated stream of TOKENS
	counts - Prints a vector of counts from a newline-separated stream of tokens
	dot - Dot product of multiple vectors
	detriangularize - Computes a dense 2D matrix from a triangular matrix by copying values across the diagonal
	--help|-h|help - Print the list of subcommands or help information for a specific subcommand (e.g. "svec help dot")
	join - Concatenates numerical values with the same indices together for further processing (summation, multiplication, etc.). Empty rows are filled with 0, but if multiple vectors are joined, there may be fewer 0s than vectors. 
	map - Performs an element-wise arithmetic calculation to the numeric value of each matrix index. The current value can be accessed as $2 or $NF. Results of the arithmetic expression are automatically assigned to the numeric value.
	negate - Negates a vector
	neighbors - Accepts a 2D matrix and a vector and outputs a vector of cosine distances between the rows of the matrix and the input vector
	#join <(self vecnormalize "${2:--}") <(self normalize "$1" - | sort -k2,2 #| svecawk 'NR==1 {d=$2} d==$2 {s+=$3*$4} d!=$2 {print $2,s; s=0; d=$2}'
	usage:  join <(self vecnormalize "${2:--}") <(self normalize "$1" - | sort -k2,2 #| svecawk 'NR==1 {d=$2} d==$2 {s+=$3*$4} d!=$2 {print $2,s; s=0; d=$2}'
	norm - Computes the Euclidean norm of a vector, or an entry-wise Euclidean norm of a matrix
	normalize - Normalizes VECTOR using the Euclidean norm.
	row - Filters by rows where the leftmost column matches DIMENSION and returns an N-1 matrix by removing that dimension.
	pmi - Compute the pointwise mutual information of line-separated pairs of whitespace-separated tokens
	scale - Scale all elements by a constant
	sparse - Removes 0 valued dimensions to create sparse vector or matrix
	sqrt - Elementwise square root
	square - Elementwise square
	subtract - Subtract one or more SUBTRAHEND matrices from MINUEND
	sum - Sums all elements and returns a constant
	vecnorm - Eliminates the rightmost dimension of a matrix and computes the Euclidean norms to use as values for the remaining indices
	vecnormalize - Normalizes vectors defined by the first N-1 dimension of MATRIX
	vecsum - Eliminates the rightmost dimension of a matrix and computes the sums to use as values for the remaining indices
	word2vec - Computes matrix of log pointwise mutual information scores from the co occurrence matrix of a stream of whitespace-separated tokens that approximates word2vec embeddings
```
