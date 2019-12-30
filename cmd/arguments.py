# Parses the arguments
# and runs the user instructed commands

import argparse

# Top level parser - create parser for all the commands
parser = argparse.ArgumentParser(
    'QUITUP',
    description='Quick setup for my linux platform')
subparsers = parser.add_subparsers(
    help='sub-command help')

# Setup parser - create parser for the setup command
setupParser = subparsers.add_parser(
    'setup',
    help='setup help',
    description='')
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

parser.parse_args()