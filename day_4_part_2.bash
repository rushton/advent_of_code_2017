# after randomizing the string to int integers, it worked

# For added security, yet another system policy has been put in
# place. Now, a valid passphrase must contain no two words that
# are anagrams of each other - that is, a passphrase is invalid
# if any word's letters can be rearranged to form any other word
# in the passphrase.

# For example:
#
# abcde fghij is a valid passphrase.
# abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
# a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
# iiii oiii ooii oooi oooo is valid.
# oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.
# Under this new system policy, how many passphrases are valid?


# Solution:
# take each word and sum the characters as integers
# to give each set of characters a unique value,
# once that's finished, pipe it back into part1
#
#
# Problems:
# * found using ascii values results in collisions when
#   summing numbers, widened the possible values for each
#    character by introducing a random multiplier to the ascii
#    int value, it won't prevent all collisions, but it's good enough
#
# Tries:
# 188 too low
#
# 208 was correct after getting rid of collisions in summing
# the ascii values

while read line
do
    echo $line | awk '
    BEGIN{
        # build a dict of characters to
        # random number value, the randomness
        # reduces (but does not rule out) collisions
        # when adding strings of numbers
        for(n=0;n<256;n++)
            ord[sprintf("%c",n)]=n*(1 + int(rand() * 100000))
    }
    {
        split($0, words, " ")
        for (k in words) {
            sum=0
            split(words[k], chars, "")
            for(i in chars){sum+=ord[chars[i]]}
            printf "%s ", sum
        }
        printf "%s", "\n"

    }'
done | bash day_4_part_1.bash
