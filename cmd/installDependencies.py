from lib.system import installPackage

def installGolang():
    installPackage('golang')

def installPython():
    installPackage('python')
    installPackage('pip')

def installClangd():
    installPackage('clangd')

def installNode():
    installPackage('node')
    installPackage('npm i -g yarn')
