def installVim():
    import lib.os
    lib.os.installPackage('vim')

def copyFiles():
    from shutil import copyfile, copytree
    from pathlib import Path
    from sys import exit
    from lib.log import fatal, getWarningMessage

    # Home directory
    home = str(Path().home())

    # Copy .vimrc into root directory
    try:
        copyfile(
            './files/vim/.vimrc',
            home + '/.vimrc')
    except FileNotFoundError:
        fatal(
            '.vimrc file not found in repository\'s files directory')
        exit()

    # Copy .vim directory into root directory
    try:
        copytree(
            './files/vim/.vim',
            home + '/.vim')
    except FileNotFoundError:
        fatal(
            '.vim directory not found in repository\'s files directory')
    except FileExistsError:
        
        proceed = input(getWarningMessage(
            'Directory already exists, should I proceed? Yy/Nn: '))
        if proceed.lower() != 'y':
            return
        copytree(
            './files/vim/.vim',
            home + '/.vim',
            dirs_exist_ok=True)

def installYouCompleteMe():
    from lib.log import error
    error('installYouCompleteMe: Incomplete')

def installVundlePlugins():
    from os import system
    system('vim +BundleInstall +qall')

def setup():
    from lib.log import info, ok
    info('Installing vim ...')
    installVim()
    info('Setting up vim configurations ...')
    info('Copying vim files ...')
    copyFiles()
    info('Installing youcompleteme')
    installYouCompleteMe()
    info('Installing vundle plugins')
    installVundlePlugins()
    ok('Done!')
