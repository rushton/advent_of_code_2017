#/bin/bash
# Advent of code Day 1 Part 2
# You notice a progress bar that jumps to 50% completion. Apparently,
# the door isn't yet satisfied, but it did emit a star as encouragement.
# The instructions change:
#
# Now, instead of considering the next digit, it wants you to consider
# the digit halfway around the circular list. That is, if your list contains
# 10 items, only include a digit in your sum if the digit 10/2 = 5 steps
# forward matches it. Fortunately, your list has an even number of elements.

# split the numbers onto their own lines
sed 's/\(.\)/\1\n/g' | \
# remove any blank lines
grep -v "^$" | \
# number the lines
nl | \
# read the output backwards
tail -r | \
# for the lower half of the elements move their position near their neighbor
awk '{if(NR==1){num_elements=$1} if($1 <= num_elements/2){print $1+(num_elements/2), $1, $2}else{print $1, $1, $2}}' | \
# now sort the numbers into their new positions
sort -nk1,2 | \
# process in pairs, if the numbers match then add them to the sum
awk '
BEGIN{
    sum=0
}
NR%2!=0{
    prev=$3
}
NR%2==0{
    if(prev==$3){
        s+=$3*2
    }
}
END{
    print s
}'

