# Direct_Mapped_Cache
Implementing a direct mapped cache in verilog and demonstrating the different hit rates by varying the number 
of lines/blocks and also by varying the number of words per line/block.

Implementation Highlights : 

-> The cache is built using a multi-dimensional array to implement a matrix of 256 rows 
(number of blocks/lines) and 16 columns (number of words per block/line).

-> We’ve built a seperate register of size 256 (number of blocks/lines) to store the tags of the
blocks in cache.

-> We’ve used a valid bit to check for data or junk data before checking for hit/miss by
comparison of tags.

-> After checking the valid bit, if the block is empty or consists of junk data , we populate the
cache with data (which is the address itself in this implementation) and set the valid bit to 1
and data ouput is 0 which represents a miss.

-> If the valid bit is 1 and the tags compare, data output is 1 which represents a hit.

-> We’ve run our module on all the 5 trace files.

-> We’ve varied the number of blocks for all the 5 trace files and plotted graphs to see the
effects on the hit rate using matplotlib in python.

-> We’ve also varied the number of words per block to see the effects on the hit rates out of
personal interest. We’ve done this for only the gcc trace file.
