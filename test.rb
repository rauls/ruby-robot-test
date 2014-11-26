#!/usr/bin/env ruby

# require_relative "../lib/robot"
require File.expand_path('../lib/robot', __FILE__)

require 'test/unit'

class TestRobot < Test::Unit::TestCase

  def setup
    @robot = Robot::Application.new(ARGV)
  end
  
  def test_first
  	assert_equal( "0,0,NORTH", @robot.test( "data/test_first.txt" ) )
  end
  
  def test_left
  	assert_equal( "0,0,WEST",  @robot.test( "data/test_left.txt" ) )
  end
  
  def test_right
	  assert_equal( "0,0,EAST",  @robot.test( "data/test_right.txt" ) )
  end
  
  def test_movenorth
	  assert_equal( "0,1,NORTH", @robot.test( "data/test_movenorth.txt" ) )
  end
  
  def test_moveeast
	  assert_equal( "1,0,EAST",  @robot.test( "data/test_moveeast.txt" ) )
  end
  
  def test_movewest
	  assert_equal( "0,0,WEST",  @robot.test( "data/test_movewest.txt" ) )
  end
  
  def test_movesouth
	  assert_equal( "0,0,SOUTH", @robot.test( "data/test_movesouth.txt" ) )
  end
  
  def test_corners
	  assert_equal( "0,0,SOUTH", @robot.test( "data/test_corners.txt" ) )
  end
  
  def test_33north
	  assert_equal( "3,3,NORTH", @robot.test( "data/test_33north.txt" ) )
  end
  
  def test_33east
	  assert_equal( "3,3,EAST",  @robot.test( "data/test_33east.txt" ) )
  end
  
end


