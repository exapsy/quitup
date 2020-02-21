import sys
if sys.version_info[0] < 3 or sys.version_info[1] < 8:
    raise Exception("Must be using Python 3.8")

import cmd.checkPlatform
import cmd.argParser
