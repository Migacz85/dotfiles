import sys, clipboard

path='/home/migacz/notes.txt'


def read_file(path):
    f = open(path, 'r')
    read = f.read()
    f.close()
    print('Your saved notes:')
    print(read)

def write_file(text, file):
    f= open(file, 'w')
    f.write('hello')
    f.close()

def append_file(text, file):
    f= open(file, 'a')
    f.write(text + '\n')
    f.close()

def delete_last_line(file, number):
    readFile = open(file)
    lines = readFile.readlines()
    readFile.close()
    w = open(file,'w')
    w.writelines([item for item in lines[:int(number)]])
    w.close()

if sys.argv[1]=='help':
    print('Welcome in qnote')
    print('qnote.py c "hello" - will write comment "hello" to to your notes')
    print('qnote.py show - will show your notes')
    print('qnote.py clip - add your clipboard to the file')
    print('qnote.py d -1 - delete one line from the end of file')

if sys.argv[1]=='show':
    read_file(path)  

if sys.argv[1]=='clip': # paste clipboard
    text=clipboard.paste()
    append_file(text, path)
    read_file(path) 
if sys.argv[1]=='d': # delete one line
    delete_last_line(path, sys.argv[2])
    read_file(path) 
if sys.argv[1]=='c': # comment
    append_file("#######", path)
    append_file("# "+sys.argv[2]+":", path)
    append_file("#######", path)
    read_file(path) 

