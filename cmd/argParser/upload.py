from cmd.argParser import ARGS
from lib import vim, zsh

shouldSetupAll = (
(
    ARGS.all == True
) or (
    ARGS.all == False and
    ARGS.zsh == False and
    ARGS.vim == False
) or (
    ARGS.zsh == True and
    ARGS.vim == True
))

if shouldSetupAll:
    print('Uploading all configurations')
    zsh.upload()
    vim.upload()
elif ARGS.zsh:
    print('Uploading zsh')
    zsh.upload()
elif ARGS.vim:
    print('Uploading vim')
    vim.upload()
