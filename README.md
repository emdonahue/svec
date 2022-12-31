# svec
Streaming computations over sparse vectors and matrices for use in text mining and NLP

## Documentation
```
usage: svec <subcommand> [arguments]
	cooccurrences - Prints a 2D matrix of counts of token co-occurrence within a given window computed from a whitespace-separated file of tokens
	counts - Prints a vector of counts from a newline-separated stream of tokens
	--help|-h|help - Print the list of subcommands or help information for a specific subcommand (e.g. "svec help dot")
	join - Concatenates numerical values with the same indices together for further processing (summation, multiplication, etc.)
	scale - Scale all elements by a constant
	sum - Element-wise sum
	word2vec - Computes matrix of log pointwise mutual information scores from a stream of whitespace-separated tokens that approximate word2vec embeddings. File must be seekable.
```
