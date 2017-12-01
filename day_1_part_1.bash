#!/bin/bash
# Code of Advent Day 1:
# The captcha requires you to review a sequence of digits (your puzzle input)
# and find the sum of all digits that match the next digit in the list. The list is
# circular, so the digit after the last digit is the first digit in the list.
#
# Examples:
# 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
# 1111 produces 4 because each digit (all 1) matches the next.
# 1234 produces 0 because no digit matches the next.
# 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.

# separate each digit onto separate lines
# Sample output for input: '1122'
# 1
# 1
# 2
# 2
sed 's/\(.\)/\1\n/g' | \
# print the first digit at the end to simulate wrap around
# also filter any non-numeric lines
# Sample output for input: '1122'
# 1
# 1
# 2
# 2
# 1
awk '/[0-9]/{if(NR==1){first=$1} print}END{print first}' | \
# count the repeating digits
# Sample output for input: '1122':
# 2 1
# 2 2
uniq -c | \
# sum accordingly
# subtract one from the number of occurences as it means there
# is one digit without a repeating digit next (or is the wrap-around value)
# then multiply by the value
awk '{sum+=($1-1)*$2}END{print sum}'
