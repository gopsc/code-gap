

,, initialize seed

( initialize the pseudo-random number generator, causing it to start at an arbitrary point in its random sequence )

randomSeed ( unsigned int seed );


seed :  ( a number to generate the seed )


none returns






,, obtains random number

( always call the randomSeed function before using this function )

long random ( long minimum_number, long maximum_number );


minimum_number :  ( lower bound of the random value, inclusive, optional )

maximum :  ( upper bound of the random value, exclusive, optional )


returns a random number, long





,

