# svec
Streaming computations over sparse vectors and matrices for use in text mining and NLP

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
svec - Streaming computations over sparse vectors and matrices for use in text mining and NLP
Usage: svec SUBCOMMAND [ARGUMENTS...]

General Options:
	-g	Specifies decimal precision of arithmetic

Subcommands:
	--help|-h|help [SUBCOMMAND]	Prints help text for SUBCOMMAND. If SUBCOMMAND omitted, prints list of subcommands.
	abs MATRIX	Element-wise absolute value
	add MATRIX [MATRIX...]	Element-wise sum of 2 or more matrices
	analogy VECTOR VECTOR VECTOR	Computes the analogy vector from 3 word2vec embeddings king:man::queen:woman => -king+man+queen=woman
	counts TOKENS	Prints a vector of counts from a newline-separated stream of tokens
	dot MATRIX [MATRIX...]	Dot product of multiple vectors
	triangular MATRIX	Converts between triangular and square 2D matrices by copying/dropping across the diagonal.
	join MATRIX [MATRIX...]	Concatenates numerical values with the same indices together for further processing (summation, multiplication, etc.). Empty rows are filled with 0, but if multiple vectors are joined, there may be fewer 0s than vectors.
	julia MATRIX...	Opens an interactive Julia prompt on MATRIX loaded as an IndexedTable. Creates an array, "svec," which contains the IndexedTable objects in the same order as the arguments supplied.
	map EXPRESSION MATRIX	Performs an element-wise arithmetic calculation to the numeric value of each matrix index. The current value can be accessed as $2 or $NF. Results of the arithmetic expression are automatically assigned to the numeric value.
	negate MATRIX	Negates a vector
	neighbors VECTOR 2D-MATRIX	Accepts a 2D matrix and a vector and outputs a vector of cosine distances between the rows of the matrix and the input vector
	norm MATRIX	Computes the entry-wise Euclidean norm of a matrix
	normalize VECTOR	Normalizes VECTOR using the Euclidean norm.
	row DIMENSION MATRIX	Filters by rows where the leftmost column matches DIMENSION and returns an N-1 matrix by removing the leftmost dimension.
	pmi BIGRAMCOUNTS	Compute the pointwise mutual information of the BIGRAMCOUNTS as produced by running count on a bigram stream.
	scale CONSTANT MATRIX	Scale all elements by a constant
	sparse MATRIX	Removes 0 valued dimensions to create sparse vector or matrix
	sqrt MATRIX	Elementwise square root
	square MATRIX	Elementwise square
	subtract MINUEND SUBTRAHEND...	Subtract one or more SUBTRAHEND matrices from MINUEND
	sum MATRIX	Sums all elements and returns a constant
	vecnorm MATRIX	Eliminates the rightmost dimension of a matrix and computes the Euclidean norms to use as values for the remaining indices
	vecnormalize MATRIX	Normalizes vectors defined by the first N-1 dimension of MATRIX
	vecsum MATRIX	Eliminates the rightmost dimension of a matrix and computes the sums to use as values for the remaining indices
	word2vec WINDOW [TOKENS]	Computes matrix of log pointwise mutual information scores from the co occurrence matrix of a stream of whitespace-separated tokens that approximates word2vec embeddings
```
## TODO
- optimize neighbors
- add -s sorted flag to counts to add extra sorting step. maybe should be global
- extend caching to all subcommands
