#!/usr/bin/env ruby
#
# Written by {{ cookiecutter.name }}
# Year {{ cookiecutter.year }}
#

# require OptionParser
require 'optparse'

usage = -<<EOF
Usage: #{$0} [-h] [-v] [-t INT] read1 read2

positional arguments:
    read1                            first read pair
    read2                            second read pair

optional arguments:
    -h, --help                       display usage
EOF

# create an OptionParser object
option_parser = OptionParser.new do |opts|
  opts.banner = usage
  opts.on('-v', '--verbose', 'verbose mode')
  opts.on('-t [8]', '--threads [8]', "number of threads (default: 8)")
end

# set default
options = { threads: 8 }
# ARGV will be modified destructively
option_parser.parse!(into: options)

if ARGV.length != 2
  puts option_parser
  exit
end

fastq1 = ARGV[0]
fastq2 = ARGV[1]

if options[:verbose]
  puts "Verbose mode"
end

# access input options
puts "Read 1: #{fastq1}"
puts "Read 2: #{fastq2}"
puts "Using #{options[:threads]} threads"
exit
