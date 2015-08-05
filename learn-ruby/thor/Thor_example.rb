require 'thor'

class MyCLI < Thor
  # class options that apply across all commands for a class.
  class_option :verbose, :type => :boolean
  
  desc "hello NAME", "say hello to NAME"
  def hello(name)
    puts "Hello #{name}"
  end

  # optional arguments
  desc "hello1 NAME", "say hello1 to NAME"
  def hello1(name, from=nil)
    puts "from: #{from}" if from
    puts "Hello #{name}"
  end

  # long description
  desc "hello2 NAME", "say hello2 to NAME"
  long_desc <<-LONGDESC
    `cli hello` will print out a message to a person of your
    choosing.
 
    You can optionally specify a second parameter, which will print
    out a from message as well.
 
    > $ cli hello "Yehuda Katz" "Carl Lerche"
    \x5> from: Carl Lerche
  LONGDESC
  def hello2(name, from=nil)
    puts "from: #{from}" if from
    puts "Hello #{name}"
  end

  # options and flags
  desc "hello3 NAME", "say hello3 to NAME"
  option :from
  def hello3(name)
    puts "from: #{options[:from]}" if options[:from]
    puts "Hello3 #{name}"
  end

  # option of different type
  option :from
  option :yell, :type => :boolean
  desc "hello4 NAME", "say hello4 to NAME"
  def hello4(name)
    output = []
    output << "from: #{options[:from]}" if options[:from]
    output << "Hello4 #{name}"
    output = output.join("\n")
    puts options[:yell] ? output.upcase : output
  end

  # option required
  option :from, :required => true
  option :yell, :type => :boolean
  desc "hello5 NAME", "say hello5 to NAME"
  def hello5(name)
    output = []
    output << "from: #{options[:from]}" if options[:from]
    output << "Hello5 #{name}"
    output = output.join("\n")
    puts options[:yell] ? output.upcase : output
  end

  # meta data about options: :desc, :banner, :required, :default, :type: :string, :hash, :array, :numeric, or :boolean
  # shorthand
  # options :from => :required, :yell => :boolean
  
end

MyCLI.start(ARGV)

# start the CLI with MyCLI.start(ARGV)
# If arguments are empty, Thor will print put a help listing.

=begin

$ ruby MyCLI.rb
Commands:
  MyCLI.rb hello NAME      # say hello to NAME
  MyCLI.rb help [COMMAND]  # Describe available commands or one specific command

$ ruby MyCLI.rb hello
ERROR: "MyCLI.rb hello" was called with no arguments
Usage: "MyCLI.rb hello NAME"

$ ruby MyCLI.rb hello yatin
Hello yatin

$ ruby MyCLI.rb help hello
Usage:
  MyCLI.rb hello NAME

say hello to NAME

$ ruby ./cli hello3 --from "Carl Lerche" Yehuda
from: Carl Lerche
Hello Yehuda
 
$ ruby ./cli hello3 Yehuda --from "Carl Lerche"
from: Carl Lerche
Hello Yehuda
 
$ ruby ./cli hello3 Yehuda --from="Carl Lerche"
from: Carl Lerche
Hello Yehuda

$ ./cli hello4 --yell Yehuda --from "Carl Lerche"
FROM: CARL LERCHE
HELLO YEHUDA
 
$ ./cli hello4 Yehuda --from "Carl Lerche" --yell
FROM: CARL LERCHE
HELLO YEHUDA

$ ./cli hello5 Yehuda
No value provided for required options '--from'

=end


# subcommands
# eg. git remote add
# Solution: creating a new Thor class to represent the subcommand, and point to it from the parent class.

module GitCLI
  class Remote < Thor

  end

  class Git < Thor
    desc "remote SUBCOMMAND ...ARGS", "manage set of tracked repos"
    subcommand "remote", Remote
  end
end





