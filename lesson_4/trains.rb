class Station
  def initialize(station_name)
    @station_name = station_name
    @passenger_trains_at_station = []
    @cargo_trains_at_station = []
  end

  def add_train_to_station(train_number, train_type)
    case train_type
    when 'Cargo'
      @cargo_trains_at_station << train_number
    when 'Passenger'
      @passenger_trains_at_station << train_number
    else
      puts 'Please enter correct train type: Cargo or Passenger'
    end
  end

  def trains_list_full
    puts "Trains at the station #{@passenger_trains_at_station + @cargo_trains_at_station}"
  end

  def trains_list_by_type
    puts "Passanger trains: #{@passenger_trains_at_station}; Cargo trains: #{@cargo_trains_at_station}"
  end

  def train_leaving(train_leaving_name)
    @train_leaving_name = train_leaving_name
    if (@passenger_trains_at_station + @cargo_trains_at_station).include? train_leaving_name
      @passenger_trains_at_station.delete_if { |passenger| passenger.include? train_leaving_name }
      @cargo_trains_at_station.delete_if { |cargo| cargo.include? train_leaving_name }
      puts "Train #{train_leaving_name} has left the station"
    else
      puts 'There is no such train at the station'
    end
  end
end

class Route
  def initialize(first_station, last_station)
    @route = [first_station, last_station]
  end

  def add_station_to_route(middle_station)
    @route.insert(-2, middle_station)
  end

  def del_station_from_route(station_to_del)
    if @route.include? station_to_del
      @route.delete(station_to_del)
      puts "Station #{station_to_del} has been deleted"
    else
      puts 'Station you want to delete is not on the route'
    end
  end

  def route_show
    puts "The route: #{@route}"
  end
end

class Train
  def initialize(train_number, train_type, carriages_number)
    @train_number = train_number
    @train_type_list = {}
    @train_type_list[train_number] = train_type
    @carriages_number = carriages_number
    @speed = 0
  end

  def train_speed_add(speed)
    if speed >= 0
      @speed += speed
    else
      puts 'Please enter speed that is higher than 0!'
    end
  end

  def train_speed_show
    puts "Current speed: #{@speed}"
  end

  def train_stop
    @speed = 0
    puts 'Train has stopped'
  end

  def carriages_number_show
    puts "Number of carriages for #{@train_number} is #{@carriages_number}"
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
