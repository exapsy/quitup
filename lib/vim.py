from lib import HOME_DIR, VIM_DIR

def installNeovim():
    from os import system
    system('sudo pip install neovim')

def extractFilesToHome():
    from shutil import copyfile, copytree
    from sys import exit
    from lib import log

    # Copy .vimrc into root directory
    try:
        copyfile(
            VIM_DIR + '.vimrc',
            HOME_DIR + '.vimrc',
        )
    except FileNotFoundError:
        log.fatal('.vimrc file not found in repository\'s files directory')

    # Copy .vim directory into root directory
    try:
        copytree(
            VIM_DIR + '.vim',
            HOME_DIR + '.vim',
        )

    except FileNotFoundError:
        log.fatal('.vim directory not found in repository\'s files directory')
        
    except FileExistsError:
        proceed = input(log.getWarningMessage(
            'Directory already exists, should I proceed? Yy/Nn: '))
        if proceed.lower() != 'y':
            return
        copytree(
            VIM_DIR + '.vim',
            HOME_DIR + '.vim',
            dirs_exist_ok=True,
        )

    try:
        copytree(
            VIM_DIR + '.config/nvim',
            HOME_DIR + '.config',
        )

    except FileNotFoundError:
        log.fatal('.config/nvim directory not found in repository\'s files directory')
        
    except FileExistsError:
        proceed = input(log.getWarningMessage(
            'Directory already exists, should I proceed? Yy/Nn: '))
        if proceed.lower() != 'y':
            return
        copytree(
            VIM_DIR + '.config/nvim',
            HOME_DIR + '.config',
            dirs_exist_ok=True,
        )

def setupCoc():
    from os import system
    from lib import log
    
    # JEDI used for python autocomplete
    system('sudo pip install jedi')
    system('cd ~/.vim/bundle/coc.nvim && yarn')
    
    # Install Coc dependencies
    cocPlugins = ' '.join([
        'coc-yaml',
        'coc-webpack',
        'coc-tsserver',
        'coc-tslint-plugin',
        'coc-syntax',
        'coc-svg',
        'coc-python',
        'coc-prettier',
        'coc-markdownlint',
        'coc-json',
        'coc-jest',
        'coc-highlight',
        'coc-go',
        'coc-git',
        'coc-css',
    ])
    system('vim +CocInstall ' + cocPlugins)


def installVundlePlugins():
    from os import system

    system('vim +BundleInstall +qall')

def setup():
    from lib import log

    log.info('Installing neovim ...')
    installNeovim()
    log.info('Setting up vim configurations ...')
    log.info('Extracting vim files ...')
    extractFilesToHome()
    log.info('Installing vundle plugins')
    installVundlePlugins()
    log.info('Setting up Coc')
    setupCoc()
    log.ok('Done!')

def upload():
    from os import system
    from lib import log

    log.info('Importing .vimrc')
    system('cp ' + HOME_DIR + '/.vimrc' + ' ' + VIM_DIR)
    log.info('Importing .vim directory')
    system('cp -R ' + HOME_DIR + '/.vim' + ' ' + VIM_DIR)
    log.info('Importing ./.config/nvim directory')
    system('cp -R ' + HOME_DIR + '/.config/nvim' + ' ' + VIM_DIR)
