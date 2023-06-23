#!/usr/bin/env python3
#
# Written by {{ cookiecutter.name }}
# Year {{ cookiecutter.year }}
#

import argparse
ver = "0.0.1"
parser = argparse.ArgumentParser()

#
# positional arguments
#

# default type is string
parser.add_argument(
        "string",
        help = "display a string",
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
        help = "Show script version and exit",
        action = "store_true"
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

if args.version:
    print(ver)
    quit()

if args.threads:
    print("Using %d threads" % args.threads)

print("%s's type is %s" % (args.string, type(args.string)))
print("%s's type is %s" % (args.number, type(args.number)))
