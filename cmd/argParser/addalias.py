from cmd.argParser import ARGS

destinationFile = ARGS.dest

from lib.log import fatal
if not destinationFile:
    fatal('''
    Empty destination,
    try defining a different destination
    with `--dest`\ndefault is `/home/<user>/.zshrc`
    ''')

import sys, os
from lib.os import sudoScript

# Get path (eg '/home/joe/something/quitup/quitup.py')
appScriptPath = sys.argv[0]
alias = '\'alias quitup=\"/usr/bin/python ' + appScriptPath + '\"\''
addAliasCmd = sudoScript('echo ' + alias + ' >> ' + destinationFile)
os.system(addAliasCmd)