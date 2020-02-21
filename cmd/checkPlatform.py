# Determines if the running platform
# is valid for the installation

from lib import system

platform = system.getOS()

if platform != 'Linux':
    print('Unsupported platform: ', platform)
