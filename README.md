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
```
## TODO
- optimize neighbors
- add -s sorted flag to counts to add extra sorting step. maybe should be global
- extend caching to all subcommands
- join behaves incorrectly when presented with the zero vector (a completely empty file) using auto. recursively pass number of files processed and manually compute join output. test with subtract
- experiment with </dev/tty for interactive julia, as in kb
- 
