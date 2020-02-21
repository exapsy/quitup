import sys
if sys.version_info[0] < 3:
    raise Exception("Must be using Python 3")

import cmd.checkPlatform
import cmd.argParser
