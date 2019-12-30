# Determines if the running platform
# is valid for the installation

import lib.os

platform = lib.os.getOS()

if platform != 'Linux':
    print('Unsupported platform: ', platform)