from lib.colors import bcolors

# fatal logs error and exists
def fatal(msg):
    print(
        bcolors.FAIL +
        msg +
        bcolors.ENDC)

def info(msg):
    print(
        bcolors.OKGREEN +
        msg +
        bcolors.ENDC)

def ok(msg):
    info(
        bcolors.BOLD +
        msg)