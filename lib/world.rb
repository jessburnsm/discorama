class World
  WORLD_WIDTH  = 3
  WORLD_HEIGHT = 2

  def initialize
    @starting_room = Entrance.new
    @rooms =
    [ [ WomensBathroom.new, Lounge.new ],
      [ @starting_room, Dancefloor.new ],
      [ MensBathroom.new, Bar.new ]]
  end

  def get_room_of(entity)
    @rooms[entity.x_coord][entity.y_coord]
  end

  def move_entity_north(entity)
    if entity.y_coord > 0
      entity.y_coord -= 1
    else
      world_barrier
    end
  end

  def move_entity_south(entity)
    if entity.y_coord < WORLD_HEIGHT - 1
      entity.y_coord += 1
    else
      world_barrier
    end
  end

  def move_entity_east(entity)
    if entity.x_coord < WORLD_WIDTH - 1
      entity.x_coord += 1
    else
      world_barrier
    end
  end

  def move_entity_west(entity)
    if entity.x_coord > 0
      entity.x_coord -= 1
    else
      world_barrier
    end
  end

  private

  def world_barrier
    puts GameText.new.map_barrier
  end
end
