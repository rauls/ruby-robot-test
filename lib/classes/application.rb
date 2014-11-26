##########################################
# application.rb - high level app
# Author:: Raul Sobon
#
# Our little robot friend
# Accept input from FILE or from STDIN
# Run run.sh or bin/robot
#

require "optparse"

module Robot
  class Application
    def initialize(argv)
      @files = parse_options(argv)
      @commander = Robot::Commands.new(5,5);
    end

    def parse_options(argv)
      parser = OptionParser.new 
      parser.parse(argv)
    end

		# Process passed in file, or from STDIN
    def run
      if @files.empty?
        @commander.Process(STDIN)
      else
        @files.each do |filename|
          File.open(filename) { |f| @commander.Process(f) }
        end 
      end
    end

    def test(filename)
      @commander.Process( File.open(filename) )
    end    
  end # Class Application

end # Module
