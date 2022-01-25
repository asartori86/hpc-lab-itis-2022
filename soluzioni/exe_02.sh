#!/bin/bash

# compute the mean of the entries of a file


awk '{x += $1} END {print x/NR}' NENE02043A.txt

# compute the mean for many files

awk 'FNR==1 {x=$1; getline} {x+=$1} ENDFILE {print FILENAME, x/FNR}' NENE0*

# find max of all files

# credits: Stefano Pettirosso
awk 'FNR==1 {max=$1; getline} $1>max {max=$1} ENDFILE {print FILENAME, max}' NENE0*

awk 'FNR==1 {max=$1; getline} {max=($1>max ? $1 : max )} ENDFILE {print FILENAME, max}' NENE0*
