# Parses the arguments
# and runs the user instructed commands

import argparse

# Top level parser - create parser for all the commands
parser = argparse.ArgumentParser(
    'QUITUP',
    description='Quick setup for my linux platform')
parser.add_argument(
    '-v',
    '--version',
    help='show program version',
    action='store_true')
subparsers = parser.add_subparsers(
    help='sub-command help')

# Setup parser - create parser for the setup command
setupParser = subparsers.add_parser(
    'setup',
    help='setup help',
    description='')
setupParser.set_defaults(which='setup')
setupParser.add_argument(
    '--all',
    action='store_true',
    default=False,
    help='Setups all configurations & ensures all packages are installed')
setupParser.add_argument(
    '--vim',
    action='store_true',
    default=False,
    help='Setups vim configurations & installs vim')
setupParser.add_argument(
    '--zsh',
    action='store_true',
    default=False,
    help='Setups all configurations & installs zsh & oh-my-zsh')

# Upload parser - create parser for upload command 
uploadParser = subparsers.add_parser(
    'upload',
    help='upload help',
    description='Uploads configuration changes to git')
uploadParser.set_defaults(which='upload')
uploadParser.add_argument(
    '--all',
    action='store_true',
    default=False,
    help='Commits and pushes all configuration changes')
uploadParser.add_argument(
    '--vim',
    action='store_true',
    default=False,
    help='Commits and pushes vim changes')
uploadParser.add_argument(
    '--zsh',
    action='store_true',
    default=False,
    help='Commits & pushes zsh changes')

# Addalias parser - create parser for addalias command
addalias = subparsers.add_parser(
    'addalias',
    help='addalias help',
    description='''
        Adds a \'quitup\' alias
        to the destination file
        (default destination is ~/.zshrc)
    ''')
addalias.set_defaults(which='addalias')
addalias.add_argument(
    '--dest',
    action='store_const',
    default='~/.zshrc',
    help='Defines the destination file where the alias should be placed'
)

ARGS = parser.parse_args()

if ARGS.version:
    from lib.app import getRelease
    print(getRelease())

elif ARGS.which == 'setup':
    import cmd.argParser.setup

elif ARGS.which == 'upload':
    import cmd.argParser.upload

elif ARGS.which == 'addalias':
    import cmd.argParser.addalias
