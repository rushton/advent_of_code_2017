#!/bin/bash

# The spreadsheet consists of rows of apparently-random numbers.
# To make sure the recovery process is on the right track, they
# need you to calculate the spreadsheet's checksum. For each row,
# determine the difference between the largest value and the smallest
# value; the checksum is the sum of all of these differences.
#
# For example, given the following spreadsheet:
#
# 5 1 9 5
# 7 5 3
# 2 4 6 8
#
# The first row's largest and smallest values are 9 and 1, and their difference is 8.
# The second row's largest and smallest values are 7 and 3, and their difference is 4.
# The third row's difference is 6.
# In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.

# for each line in the input
while read line
do
    echo $line  | \
    # put each number on it's own line
    sed 's/\([0-9]\+\)/\1\n/g' | \
    # find the min and max, then calculate the difference
    awk -F='\t' 'BEGIN{
        max = 0;
        min = 999999999;
    }
    /[0-9]/{
        max=(max>$1)?max:$1
        min=(min<$1)?min:$1
    }
    END{
        print max - min
    }
    '

done | \
# calculate the sum of all the differences
awk '{s+=$1}END{print s}'
