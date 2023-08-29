#!/usr/bin/env python3
#
# Written by {{ cookiecutter.name }}
# Year {{ cookiecutter.year }}
#

import argparse
import os.path
import fileinput
ver = "0.1.0"
parser = argparse.ArgumentParser()

#
# positional arguments
#

# default type is string
parser.add_argument(
        "infile",
        help = "STDOUT from AbRSA",
)
# specify integer type
parser.add_argument(
        "number",
        help = "display a number",
        type = int
)

#
# optional arguments
#

# short and long options
# store True if specified
parser.add_argument(
        "-b",
        "--verbose",
        help = "verbose mode",
        action = "store_true"
)
parser.add_argument(
        "-v",
        "--version",
        help = "show script version and exit",
        action = "version",
        version = ver
)

# set choices for argument and default value
parser.add_argument(
        "-p",
        "--threads",
        help = "number of threads",
        choices = range(1,9),
        default = 2,
        type = int
)

args = parser.parse_args()

if args.verbose:
    print("Verbose mode")

if args.threads:
    print("Using %d threads" % args.threads)

# stream from STDIN
if args.infile == "-":
    for line in fileinput.input():
        line = line.rstrip()
        print(line)
else:
    if os.path.exists(args.infile):
        with open(args.infile) as f:
            for line in f:
                line = line.rstrip()
                print(line)
    else:
        print(f"{args.infile} does not exist")
        quit(1)
