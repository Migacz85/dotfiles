#-------------------------------------------------
# sudo pip install PyMuPDF 
# sudo pip3 install fitz

import fitz                                # the binding PyMuPDF
import sys

# print 'Number of arguments:', len(sys.argv), 'arguments.'
print('Argument List:', str(sys.argv[1:0]))

fout = fitz.open()                         # new PDF for joined output
flist = sys.argv[1:]                       # ["1.pdf", "2.pdf", ...]  # list of filenames to be joined
# print(pages_total)

for f in flist:
    fin = fitz.open(f)                     # open an input file
    toc1 = fin.getToC(False)
    toc2 = fout.getToC(False)
    pages = len(fin)
    fout.insertPDF(fin)                    # append
    for t in toc2:                         # increase toc2 page numbers
        t[2] += pages
    fout.setToC(toc1+toc2)
    fin.close()
fout.save("joined.pdf")

# This workaround work but pdf is taking 2times space that it should have. FIX !
flist.reverse()
for f in flist:
    fin = fitz.open(f)
    toc1 = fin.getToC(False)
    toc2 = fout.getToC(False)
    pages = len(fin)
    fout.insertPDF(fin)
    for t in toc2:                         # increase toc2 page numbers
        t[2] += pages
    fout.setToC(toc1+toc2)
    fin.close()
fout.save("joined.pdf")


#-------------------------------------------------
