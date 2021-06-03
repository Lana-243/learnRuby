class Station
  def initialize(station_name)
    @station_name = station_name
    @passenger_trains = []
    @cargo_trains = []
  end

  def add_train_to_station(train)
    case train.type
    when 'Cargo'
      @cargo_trains << train
    when 'Passenger'
      @passenger_trains << train
    end
  end

  def all_trains
    @passenger_trains + @cargo_trains
  end

  def trains_list_full
    all_trains.map(&:train).join(‘, ’)
  end

  def trains_list_by_type
    puts "Passenger trains: #{@passenger_trains.map(&:train).join(‘, ’)}; Cargo trains: #{@cargo_trains.map(&:train).join(‘, ’)}"
  end

  def train_leaving(train_leaving)
    if (@passenger_trains + @cargo_trains).include? train_leaving
      @passenger_trains.delete_if { |passenger| passenger.include? train_leaving }
      @cargo_trains.delete_if { |cargo| cargo.include? train_leaving }
    end  
 end

class Route
  attr_reader :route

  def initialize(route, first_station, last_station)
    @route_name = route
    @route_stations = [first_station, last_station]
  end

  def add_station(middle_station)
    @route_stations.insert(-2, middle_station)
  end

  def trains_list_full
    @route_stations.map(&:train).join(‘, ’)
  end

  def del_station(station_to_del)
      @route_stations.delete(station_to_del) if @route_stations.include? station_to_del
  end
end 

class Train
  attr_reader :name, :type, :speed, :carriages_number
  def initialize(name, type, carriages_number)
    @name = name
    @type = type
    @carriages_number = carriages_number
    @speed = 0
  end

  def train_speed_add(speed)
    @speed += speed if speed > 0
  end

  def train_stop
    @speed = 0
  end

  def carriages_number_change(change_car)
    if @speed.zero? && (carriages_number + change_car) > 0
      @carriages_number += change_car
    end
  end 

  def route_add(route)
    @route = route
    @station_index = 0
    @route.route_stations[@station_index].@add_train_to_station(self)
  end  

  def route_add(route)
    @route = route
    @station_index = 0
    @route.route_stations[@station_index].@add_train_to_station(self)
  end  

  def move_fwd
    @route.curr_station.train_leaving(self)
    @station_index += 1
    @route.curr_station.add_train_to_station(self)
  end

  def move_bckwd
    @route.curr_station.train_leaving(self)
    @station_index -= 1
    @route.curr_station.add_train_to_station(self)
  end

  def curr_station
    @route.route_stations[@station_index]
  end

  def next_station
    @route.route_stations[@station_index+1]
  end

   def prev_station
    @route.route_stations[@station_index-1] if station_index > 0
   end
end
