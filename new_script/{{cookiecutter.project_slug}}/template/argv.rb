#!/usr/bin/env ruby
#
# Written by {{ cookiecutter.name }}
# Year {{ cookiecutter.year }}
#

# require OptionParser
require 'optparse'

ver = "0.0.1"

usage = -<<EOF
Usage: #{$0} [-h] [-b] [-v] [-t INT] read1 read2

positional arguments:
    read1                            first read pair
    read2                            second read pair

optional arguments:
    -h, --help                       display usage
EOF

# create an OptionParser object
option_parser = OptionParser.new do |opts|
  opts.banner = usage
  opts.on('-b', '--verbose', 'verbose mode')
  opts.on('-v', '--version', 'display version')
  opts.on('-t [2]', '--threads [2]', "number of threads (default: 2)")
end

# set default
options = { threads: 2 }
# ARGV will be modified destructively
option_parser.parse!(into: options)

if options[:version]
  STDERR.puts "#{ver}"
  exit
end

if ARGV.length != 2
  puts option_parser
  exit
end

fastq1 = ARGV[0]
fastq2 = ARGV[1]

if options[:verbose]
  STDERR.puts "Verbose mode"
  STDERR.puts "Using #{options[:threads]} threads"
end

# access input options
puts "Read 1: #{fastq1}"
puts "Read 2: #{fastq2}"
exit
