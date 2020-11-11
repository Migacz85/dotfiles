# This script is inspired on mnemotechnick that is helping memorize numbers.
# Each number represnt a char for example 0 is s 1 is t or d 2 is n 3 is m
# etc..
# If you want to memorize for example number 174 you need to change numbers
# in to letters. You can make it calling this python code with flag:
# python words.py -n 174
# And script will find all words that can be used to memorize this letter.
# (with original letters 174 - tkr in place)


import re
import unicodedata
from trans import trans
from itertools import product, chain
import sys

DIR="/home/migacz/.scripts/words/"


def remove_vowels(s):
    result = re.sub(r'[AEIOUYaeiouy]', '', s, flags=re.IGNORECASE)
    return result


def find_word(fil, letters):
    with open(fil, 'r') as f:
        for line in f:
            for word in line.split():
                word2 = trans(word)
                if remove_vowels(word2.lower()) == letters:
                    print(word)


if str(sys.argv[1]) == "-help":
    print("==================================================================================")
    print("This is a small program for changing numbers on words that can be later memorized")
    print("==================================================================================")
    print("-n [number]   - change number to letters and find words")
    print("-c [chars]    - write custom letters to find a word that can be created")

if str(sys.argv[1]) == "-p":
    # mnems[0] = ["s", "z"]
    # mnems[9] = ["p", "b"]
    # mnems[8] = ["f", "w", "v"]
    # mnems[7] = ["k", "g"]
    numbers = sys.argv[2]

    perm = []

    # for number in numbers:
    #     if number == "1":
    #         for element in perm:



# input number when calling script
if str(sys.argv[1]) == "-n":

    letters = str(sys.argv[2])

    newstr = ""
    newstr2 = ""

    for char in letters:
        if char == "0":
            newstr2 += "s"
            newstr += "z"
        if char == "1":
            newstr2 += "d"
            newstr += "t"
        if char == "2":
            newstr2 += "n"
            newstr += "n"
        if char == "3":
            newstr2 += "m"
            newstr += "m"
        if char == "4":
            newstr2 += "r"
            newstr += "r"
        if char == "5":
            newstr2 += "l"
            newstr += "l"
        if char == "6":
            newstr2 += "ch"
            newstr += "j"
        if char == "7":
            newstr2 += "g"
            newstr += "k"
        if char == "8":
            newstr2 += "w"
            newstr += "f"
        if char == "9":
            newstr2 += "b"
            newstr += "p"

    print()
    print("This number can be converte to:")
    print(newstr, newstr2)

    print()
    print("Polish words:")
    print("-------------")
    find_word(DIR+'Polish.dic', newstr)
    if newstr != newstr2:
        find_word(DIR+'Polish.dic', newstr2)
    print("-------------")
    print("English words:")
    print("-------------")
    find_word(DIR+'words.txt', newstr)
    if newstr != newstr2:
        find_word(DIR+'words.txt', newstr2)
    print("-------------")
    print("Thanks - thats all")
    print("-------------")

if str(sys.argv[1]) == "-c":
    newstr = str(sys.argv[2])

    print()
    print("Polish words:")
    print("-------------")
    find_word(DIR+'Polish.dic', newstr)
    print("-------------")
    print("English words:")
    print("-------------")
    find_word(DIR+'words.txt', newstr)
    print("-------------")
    print("Thanks - thats all")
    print("-------------")


assert remove_vowels("turtle") == "trtl", "Vowels are NOT removed"
assert remove_vowels("mom") == "mm", "function should remove any a,e,i,o,u,y, chars"
