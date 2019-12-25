#  Vim custom distribution


# Automated tests

For checking if vim is working is working as expected. There are few 
automated tests. Run them by running command: 

`vim '+Vader! ~/.vim/*' && echo Success || echo Failure`

# Bugs

Rare:

`IOError: [Errno 4] Interrupted system cal`
  - Occurs when on read write situations

