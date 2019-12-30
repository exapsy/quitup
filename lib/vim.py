import shutil
import lib.os

def installVim():
    lib.os.installPackage('vim')

def copyFiles():
    shutil.copyfile('../files/vim/.vimrc', '~/.vimrc')
    shutil.copytree('../files/vim/.vim', '~/.vim')

def installYouCompleteMe():
    print('Incomplete')

def installVundlePlugins():
    print('Incomplete')

def setupVim():
    print('Installing vim ...')
    installVim()
    print('Setting up vim configurations ...')
    print('Copying vim files ...')
    copyFiles()
    print('Installing youcompleteme')
    installYouCompleteMe()
    print('Installing vundle plugins')
    installVundlePlugins()
    print('Done!')
