from lib import HOME_DIR, VIM_DIR

def installNeovim():
    from os import system
    from lib.system import sudoScript
    cmd = 'pip install neovim'
    system(sudoScript(cmd) + '||' + cmd)

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
            'Directory ' + '.vim' + 'already exists, should I proceed? Yy/Nn: '))
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
            HOME_DIR + '.config/nvim',
        )

    except FileNotFoundError:
        log.fatal('.config/nvim directory not found in repository\'s files directory')
        
    except FileExistsError:
        proceed = input(log.getWarningMessage(
            'Directory' + '.config/nvim' + ' already exists, should I proceed? Yy/Nn: '))
        if proceed.lower() != 'y':
            return
        copytree(
            VIM_DIR + '.config/nvim',
            HOME_DIR + '.config/nvim',
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
    log.info('Add vim and vi alias to nvim ...')
    addNvimToVimAlias()
    log.info('Setting up vim configurations ...')
    log.info('Extracting vim files ...')
    extractFilesToHome()
    log.info('Installing vundle plugins')
    installVundlePlugins()
    log.info('Setting up Coc')
    setupCoc()
    log.ok('Done!')

def addNvimToVimAlias():
    from lib import log
    source_file = None
    try:
        source_file = open(HOME_DIR + '.zshrc', mode='r+')
    except OSError:
        try:
            source_file = open(HOME_DIR + '.bashrc', mode='r+')
        except OSError:
            log.fatal("Could not find zshrc or bashrc file in home")

    found_vim_alias = False
    found_vi_alias = False
    lines = source_file.readlines()
    for line in lines:
        if line == "alias vim=nvim":
            found_vim_alias
        if line == "alias vi=nvim":
            found_vi_alias

    if not found_vi_alias:
        source_file.write('alias vi=nvim')
    if not found_vim_alias:
        source_file.write('alias vim=nvim')

    
def upload():
    from os import system
    from lib import log
    from shutil import copyfile, copytree

    log.info('Importing .vimrc')
    copyfile(
        HOME_DIR + '.vimrc',
        VIM_DIR + '.vimrc',
    )

    log.info('Importing .vim directory')
    copytree(
        VIM_DIR + '.vim/after',
        HOME_DIR + '.vim/after',
        dirs_exist_ok=True,
    )
    copytree(
        VIM_DIR + '.vim/configs',
        HOME_DIR + '.vim/configs',
        dirs_exist_ok=True,
    )

    log.info('Importing ./.config/nvim directory')
    copytree(
        HOME_DIR + '.config/nvim',
        VIM_DIR + '.config/nvim',
        dirs_exist_ok=True,
    )
    
    log.info('Uploading to git')
    system('git add . && git commit -m "Upload by quitup" && git push')
