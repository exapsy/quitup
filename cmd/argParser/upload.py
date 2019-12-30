from cmd.argParser import ARGS

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
elif ARGS.zsh:
    print('Uploading zsh')
elif ARGS.vim:
    print('Uploading vim')