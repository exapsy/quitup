from cmd.argParser import ARGS
import lib.vim
import lib.zsh

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
    lib.vim.setup()
    lib.zsh.setup()
elif ARGS.zsh:
    lib.zsh.setup()
elif ARGS.vim:
    lib.vim.setup()