module RoomsHelper
  
  def exit_room
    @exit_id = @rooms.north_exit
  end
  
end
