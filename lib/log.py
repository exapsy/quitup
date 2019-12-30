from lib.colors import bcolors

def getWarningMessage(msg):
    return (bcolors.WARNING +
        'Warning: ' +
        msg +
        bcolors.ENDC)

def warning(msg):
    print(getWarningMessage(msg))

def getErrorMessage(msg):
    return (bcolors.FAIL +
        'Error: ' +
        msg +
        bcolors.ENDC)

def error(msg):
    print(getErrorMessage(msg))

# fatal logs error and exits program
def fatal(msg):
    from sys import exit
    error(msg)
    exit()

def getInfoMessage(msg):
    return (bcolors.OKGREEN +
        msg +
        bcolors.ENDC)

def info(msg):
    print(getInfoMessage(msg))

def getOkMessage(msg):
    return getInfoMessage(
        bcolors.BOLD +
        msg)

def ok(msg):
    print(getOkMessage(msg))