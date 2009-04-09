require 'tuio_container'

class TuioCursor < TuioContainer
  
  attr_accessor :finger_id
  attr_reader  :x_speed, :y_speed, :motion_accel
  
  def self.from_params( params )
    new(  params.session_id,
          params.x_pos,
          params.y_pos 
    )
  end
  
  def initialize( session_id, x_pos, y_pos ) #, x_speed, y_speed, motion_accel )
    super( session_id, x_pos, y_pos )
    
    @x_speed = 0.0
    @y_speed = 0.0
    @motion_accel = 0.0
  end

    
  def equal_to_local_args?( args )
    @x_speed.approx_equal?(args[3] ) &&
    @y_speed.approx_equal?(args[4] ) &&
    @motion_accel.approx_equal?(args[5] )
  end
  
  def inspect
    puts "TuioCursor:"
    puts "session_id >> #{session_id}"
    puts "finger_id >> #{@finger_id}"
    puts "x_pos >> #{x_pos}"
    puts "y_pos >> #{y_pos}"
    puts "x_speed >> #{x_speed}"
    puts "y_speed >> #{y_speed}"
    puts "motion_accel >> #{motion_accel}"
  end
  
  
private 
  def args_to_container_from_cursor( args )
      #session_id, 
    [ args[0],

      # x_pos
      args[1], 

      # y_pos
      args[2], 

      # x_speed
      args[3], 

      # y_speed
      args[4], 

      # motion_accel
      args[5] ]
  end
end