# This script is inspired on mnemotechnick that is helping memorize numbers.
# Each number represnt a char for example 0 is s 1 is t or d 2 is n 3 is m
# etc..
# If you want to memorize for example number 174 you need to change numbers
# in to letters. You can make it calling this python code with flag:
# python words.py -n 174
# And script will find all words that can be used to memorize this letter.
# (with original letters 174 - tkr in place)

import re
from trans import trans
from itertools import product
import sys
# import linecache
# from linecache_data import *

DIR = "/home/migacz/.scripts/words/"

def combinations(i):

    zero = ['s', 'z']
    one = ['t', 'd']
    two = ['n']
    three = ['m']
    four = ['r']
    five = ['l']
    six = ['j']
    seven = ['k', 'g' ]
    eight = ['f', 'w', 'v']
    nine = ['p', 'b']

    # zero = ['o']
    # one = ['i']
    # two = ['n']
    # three = ['m']
    # four = ['r']
    # five = ['s']
    # six = ['g']
    # seven = ['z']
    # eight = ['b']
    # nine = ['p']

    # # Ben
    # zero = ['o']
    # one = ['a']
    # two = ['b']
    # three = ['c']
    # four = ['d']
    # five = ['e']
    # six = ['s']
    # seven = ['g']
    # eight = ['h']
    # nine = ['n']


    comb = []
    for char in str(i):
        if char == "0":
            comb.append(list(zero))
        if char == "1":
            comb.append(list(one))
        if char == "2":
            comb.append(list(two))
        if char == "3":
            comb.append(list(three))
        if char == "4":
            comb.append(list(four))
        if char == "5":
            comb.append(list(five))
        if char == "6":
            comb.append(list(six))
        if char == "7":
            comb.append(list(seven))
        if char == "8":
            comb.append(list(eight))
        if char == "9":
            comb.append(list(nine))
    if len(str(i)) <= 2:
        comb = list(product(comb[0], comb[1]))
    else:
        comb = list(product(comb[0], comb[1], comb[2]))
    return comb


def remove_vowels(s):
    result = re.sub(r'[AEIOUYaeiouy]', '', s, flags=re.IGNORECASE)
    return result


def find_word(fil, letters):
    """ find best matching"""
    with open(fil, 'r') as f:
        for line in f:
            for word in line.split():
                word2 = trans(word)
                if remove_vowels(word2.lower()) == letters:
                    print(" ", word, end='')

def find_word_loose(fil, letters):
    """ find first letter matching mnemonics rest can be random"""
    with open(fil, 'r') as f:
        for line in f:
            for word in line.split():
                if remove_vowels(word.lower())[0:2] == letters:
                    print(" ", word, end='')



def find_initials(fil, init1):
    with open(fil, 'r') as f:
        for line in f:
            for index, word in enumerate(line.split()):
                lin = line.lower()
                lin = line.split()
                if(index < (len(lin) - 1)):
                    if remove_vowels(lin[0])[0:1].lower() == init1[0:1]:
                        if remove_vowels(lin[1])[0:1].lower() == init1[1:2]:
                            print(" ", lin, end=" ")
                            return 1


if str(sys.argv[1]) == "-help":
    print("==================================================================================")
    print("This is a small program for changing numbers on words that can be later memorized")
    print("==================================================================================")
    print("-n [number]   - change number to letters and find words")
    print("-c [chars]    - write custom letters to find a word that can be created")

# organize and create a Major System list (search one individual word)
if str(sys.argv[1]) == "-list":
    count = 0
    for i in range(100):
        letters = i
        if i < 10:
            letters = "0" + str(i)
        else:
            letters = str(letters)
        print(i, end='')
        comb = combinations(letters)
        found = 0
        for elem in comb:
            # print("".join(elem), end='')
            if find_word(DIR + sys.argv[2], "".join(elem)) == 1:
                found = 1
        if found == 1:
            count = count + 1
        print()
    print("found=", count)

# organize and create a Major System list (search one individual word)
if str(sys.argv[1]) == "-list_loose":
    count = 0
    for i in range(100):
        letters = i
        if i < 10:
            letters = "0" + str(i)
        else:
            letters = str(letters)
        print(i, end='')
        comb = combinations(letters)
        found = 0
        for elem in comb:
            # print("".join(elem), end='')
            if find_word_loose(DIR + sys.argv[2], "".join(elem)) == 1:
                found = 1
        if found == 1:
            count = count + 1
        print()
    print("found=", count)


# organize and create a Major System list (look for 2 words starting at letters)
if str(sys.argv[1]) == "-list_initials":
    count = 0
    for i in range(100):
        letters = i
        if i < 10:
            letters = "0" + str(i)
        else:
            letters = str(letters)
        print(i, end='')
        comb = combinations(letters)
        found = 0
        for elem in comb:
            # print("".join(elem), end='')
            if find_initials(DIR + sys.argv[2], "".join(elem)) == 1:
                found = 1
        if found == 1:
            count = count + 1
        print()
    print("found=", count)

# input number when calling script
if str(sys.argv[1]) == "-n":

    letters = str(sys.argv[2])
    comb = combinations(letters)

    print("This number can be converted to this letter combinations:")
    for elem in comb:
        print(" ", "".join(elem), end='')
    print()

    print("Polish words:")
    print("-------------")

    for elem in comb:
        find_word(DIR + 'Polish.dic', "".join(elem))

    print()
    print("-------------")
    print("English words:")
    for elem in comb:
        # print("".join(elem), end='')
        find_word(DIR + 'words.txt', "".join(elem))

    print()
    print("-------------")
    print("Animals:")
    for elem in comb:
        # print("".join(elem), end='')
        find_word(DIR + 'animals.txt', "".join(elem))

    print()
    print("-------------")
    print("Thanks - thats all")
    print("-------------")

if str(sys.argv[1]) == "-c":
    newstr = str(sys.argv[2])
    print()
    print("Polish words:")
    print("-------------")
    find_word(DIR + 'Polish.dic', newstr)
    print("-------------")
    print("English words:")
    print("-------------")
    find_word(DIR + 'words.txt', newstr)
    print("-------------")
    print("Thanks - thats all")
    print("-------------")

if str(sys.argv[1]) == "-a":
    newstr = str(sys.argv[2])
    print()
    print("animals")
    print("-------------")
    find_word(DIR + 'animals.txt', newstr)


assert remove_vowels("turtle") == "trtl", "Vowels are NOT removed"
assert remove_vowels("mom") == "mm", "function should remove any a,e,i,o,u,y, chars"
