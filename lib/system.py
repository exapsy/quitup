import platform
import re
import os
import subprocess

# Returns 'Linux', 'Darwin' for MacOS, 'Windows'
def getOS():
    return platform.system()

# Returns 'Manjaro', 'Ubuntu' etc.
def getDistro():
    # Regex to seperate distro from version
    RegexVersionNumber = r'(?:\d+\.?|-?)*'
    RegexDistroName = r'(\w+)'
    RegexRelease = RegexVersionNumber + RegexDistroName
    regex = re.compile(RegexRelease)

    # Get distro release (eg. 5.4.2-1-MANJARO)
    release = platform.release()

    # Seperate version & distro
    splitted = regex.split(release)

    return splitted[1]

# Returns package manager
def getPackageManagerCommands():
    if getOS() != 'Linux':
        raise Exception('Not a linux distribution')

    scripts = {
        'install': [],
    }

    distro = getDistro()
    if distro == 'UBUNTU':
        scripts['install'] = ['apt', 'install', '-y']
        return scripts
    if distro == 'MANJARO':
        scripts['install'] = ['pacman', '-Sy']
        return scripts
    return scripts

def installPackage(pkgName):
    scripts = getPackageManagerCommands()
    installCmd = ' '.join(scripts['install'])
    cmd = installCmd + ' ' + pkgName
    fullCmd = sudoScript(cmd + '2>/dev/null') + ' || ' + cmd
    os.system(fullCmd)

def sudoScript(script):
    return 'sudo ' + script.strip()
