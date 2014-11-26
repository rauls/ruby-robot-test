##########################################
# commands.rb - command processing
# Author:: Raul Sobon
#
#

module Robot
  class Commands
    def initialize(max_x, max_y)
      @position = Coord.new( -1,-1, max_x, max_y, 0 )
    end

    # Load file and process commands, return final position string
    def Process( data )
      @line_no = 1

      commands = data.each_line
      loop { Read_Commands(commands) }
      
      @position.report()
    end    
    
    def Read_Commands( lines )
      line = lines.next.chomp
      Handle_Command( line.upcase )
      @line_no += 1
    end
    
    def Handle_Command( line )
      parts = line.split( /,| / )
      cmd = parts[0]
      
      if @position.on_table then
        case cmd
        when 'PLACE'
          @position.place( Integer( parts[1] ), Integer(parts[2]), parts[3] )
        when 'MOVE'
          @position.move()
        when 'LEFT'
          @position.left()
        when 'RIGHT'
          @position.right()
        when 'REPORT'
          ShowOutput()
        else 
          if parts[0] 
            puts "Command is not understood '#{parts[0]}' on line # #@line_no"
          end
        end
      else  # Only accept PLACE if we havent placed it.
        if cmd == 'PLACE' then
          @position.place( Integer( parts[1] ), Integer(parts[2]), parts[3] )
        end
      end
    end
    
    def ShowOutput
      puts @position.report()
    end
    
  end # Class Commands

end
