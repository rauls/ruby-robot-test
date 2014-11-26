###############################################
# coord.rb - handle robot movements and limits
# Author:: Raul Sobon
#

module Robot
  
  class Coord

    def initialize(x,y,xs,ys,dir)
      @x = x
      @y = y
      @xs = xs
      @ys = ys
      @direction = Integer(dir) & 0x03
      
      # Direction Map, 0 = north etc..
      @dirs = [ 'NORTH', 'EAST', 'SOUTH', 'WEST' ]
      @offsets = [ [ 0,1 ] , [ 1,0 ], [ 0,-1 ], [ -1,0 ] ]    # N,E,S,W offsets to XY
    end

    def set_dir(dir)
      unless dir.nil?
        @direction = @dirs.index( dir )
      end
    end
    
    def coord_inrange(x,y)
      return (x >= 0 and x < @xs and y >= 0 and y < @xs)
    end

    # Is the current x y with in range    
    def on_table
      return coord_inrange( @x, @y )
    end

    # Change coordinate if possible
    # Returns true if done
    def place(x,y,dir)
      raise unless x.is_a?(Numeric)
      raise unless y.is_a?(Numeric)

      if coord_inrange(x,y)
        @x = x
        @y = y
        set_dir( dir )
        return true
      elsif on_table == false then   # if target is out of range and its not on table, then set to 0,0
        @x = @y = 0
      end
      
      return false
    end
  
    def move
      if on_table then
        offset = @offsets[ @direction ]
        if offset then
          return place( @x + offset[0], @y + offset[1] , nil )
        end
      end 
      return false   
    end
  
    def left
      return false unless on_table
      @direction -= 1
      @direction &= 0x3
    end

    def right
      return false unless on_table
      @direction += 1
      @direction &= 0x3
    end

    # Return current position and direction 
    def report
      dir = @dirs[ @direction ]
      "#@x,#@y,#{dir}"
    end 
  end # Class Coord
end
