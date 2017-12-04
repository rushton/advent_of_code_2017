#!/bin/bash

# A new system policy has been put in place that requires all
# accounts to use a passphrase instead of simply a password. A
# passphrase consists of a series of words (lowercase letters)
# separated by spaces.
#
# To ensure security, a valid passphrase must contain no duplicate words.
#
# For example:
#
# aa bb cc dd ee is valid.
# aa bb cc dd aa is not valid - the word aa appears more than once.
# aa bb cc dd aaa is valid - aa and aaa count as different words.
#
# The system's full passphrase list is available as your puzzle input. How
# many passphrases are valid?

# read line-by-line
while read line
do
    echo $line | \
    # put each word on it's own line
    awk 'BEGIN{RS=" "}{print}' | \
    # get a unique count of words
    sort | uniq -c | \
    # remove any instances where the word is
    # completely unique to the line
    grep -v " 1 " | \
    # count the number of occurences where a
    # word was duplicated in the line
    wc -l
done | \
# count the number of instances where all
# the words were unique and valid passphrases
grep "0" | wc -l
