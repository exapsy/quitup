from cmd.argParser import ARGS
from lib.vim import setupVim
# from lib.zsh import setupZsh

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
    setupVim()
    # setupZsh()
elif ARGS.zsh:
    # setupZsh()
    print('Setting up zsh')
elif ARGS.vim:
    setupVim()