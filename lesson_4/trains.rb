class Station
  @@trains_at_station = {}

  def initialize(station_name)
    @station_name = station_name
  end

  def add_train_to_station(train_number, train_type)
    @@trains_at_station[train_number] = train_type
  end

  def Self.trains_list
    @@trains_at_station
    #add types
  end

  def train_leaving(train_leaving_name)
    @train_leaving_name = train_leaving_name
    #@trains = @trains.reject {|item| item.number == train.number}
    #delete from hash
  end
end

class Route
  @@route = []

  def initialize(first_station, last_station)
     @@route <<  first_station
     @@route << last_station
  end

  def add_station_to_route(middle_station)
    @@route.insert(-2, middle_station)
  end

  def del_station_from_route(station_to_del)
    if @@route.include? station_to_del
      @@route.delete(station_to_del) 
      puts "Station #{station_to_del} has been deleted"
    else
      puts 'Station you want to delete is not on the route'  
    end  
  end  

  def route_show
    puts @@route
  end
end

class Train
  @@train_type_list = {}
  def initialize(train_number, train_type, carriages_number)
    @@train_type_list[train_number] = train_type
    @carriages_number = carriages_number
    @speed = 0
  end

  def train_speed_add(speed)
    @speed += speed
  end

  def speed
    @speed
  end  

  def train_stop
    @speed = 0
  end  

  def carriages_number
    @carriages_number
  end  

  def carriages_number_change(change_car)
    if @speed == 0 && (carriages_number + change_car) > 0
      @carriages_number += change_car
    elsif (carriages_number + change_car) <= 0
      puts "Number of carriages is #{@carriages_number} and we cannot change it by #{change_car}"
    else
      puts 'Please stop the train first!'
    end
  end 
end

