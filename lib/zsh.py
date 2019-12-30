def installZsh():
    import lib.os
    lib.os.installPackage('zsh')

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
            './files/zsh/.zshrc',
            home + '/.zshrc')
    except FileNotFoundError:
        fatal(
            '.zshrc file not found in repository\'s files directory')
        exit()

    # Copy .oh-my-zsh directory into root directory
    try:
        copytree(
            './files/zsh/.oh-my-zsh',
            home + '/.oh-my-zsh')
    except FileNotFoundError:
        fatal(
            '.oh-my-zsh directory not found in repository\'s files directory')
    except FileExistsError:
        
        proceed = input(getWarningMessage(
            'Directory already exists, should I proceed? Yy/Nn: '))
        if proceed.lower() != 'y':
            return
        copytree(
            './files/zsh/.oh-my-zsh',
            home + '/.oh-my-zsh',
            dirs_exist_ok=True)

def setup():
    from lib.log import info, ok
    info('Installing zsh ...')
    installZsh()
    info('Copying zsh files ...')
    copyFiles()